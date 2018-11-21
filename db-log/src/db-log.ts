// Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.
import oracledb = require("oracledb");

console.log("=============");


let env = process.env;
console.log("Using environment variables:");
console.log("dbHost:", env.dbHost);
console.log("dbService:", env.dbService);
console.log("dbUser:", env.dbUser);
console.log("dbPassword:", env.dbPassword ? "***" : "undefined");
console.log("logTableName:", env.logTableName);

oracledb.autoCommit = true;

(async () => {
    let connection;

    try {

        let result;

        let conAttrs = {user: env.dbUser, password: env.dbPassword, connectString: env.dbHost + "/" + env.dbService};
        console.log(`Connecting to ${conAttrs.connectString} as ${conAttrs.user}`);
        connection = await oracledb.getConnection(conAttrs);

        let tableName = env.logTableName || "TDM_ACTIONS_LOG_TABLE";

        // Check if log table exists
        result = await connection.execute(
            "select count(*) from all_objects where object_type in ('TABLE','VIEW') and object_name = :tableName" +
            " and owner = :schema",
            [tableName, env.dbUser]);
        if (result!.rows![0][0] == 0) {
            console.info(`WARN: Cannot find table ${tableName} in schema ${env.dbUser}. You can use src/log-table.ddl to create the table`);
            return;
        }
        switch (env.type) {
            case "pre_publish": {
                console.log("Pre-Publish Action");
                let sql = `INSERT INTO ${env.dbUser}.${tableName} VALUES (TDM_ACTION_LOG_SEQ.nextVal, :url, :title,
                            :jobId, :outputType, :conProf, CURRENT_TIMESTAMP, NULL)`;
                result = await connection.execute(sql, [env.tdmUrl, env.jobTitle, env.jobId,
                    env.outputType, env.connectinProfileName]);
                break;
            }
            case "post_publish": {
                console.log("Pre-Publish Action");
                let sql = `UPDATE ${env.dbUser}.${tableName} set FINISHED = CURRENT_TIMESTAMP where 
                            TDM_URL = :url and JOB_ID = :job`;
                result = await connection.execute(sql, [env.tdmUrl, env.jobId]);
                break;
            }
        }
        console.log(result);

    } catch (err) {
        console.error(err);
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error(err);
            }
        }
    }
})();

