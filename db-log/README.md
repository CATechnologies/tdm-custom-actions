# TDM Action Service Example - DB Log
This action logs invocation of this action in a database table. When this actions is registered as a pre/post build
action, it will store information about its invocation in the database.

This action is based on [Oracle Instance Client container](https://www.oracle.com/technetwork/database/database-technologies/instant-client/overview/index.html). After accepting the license,
you can get the container free. 
  
Node.js is part of the container to run the action script. 

The action script is implemented in TypeScript and uses Node.js Oracle DB client (node-oracledb). 

The documentation of node-oracledb DB is available [here](https://oracle.github.io/node-oracledb/doc/api.html).

**Note that the action assumes that the log table already exists in the database. You can use [log-table.ddl](src/log-table.ddl)
to create the table.**

## TDM Variables
You do not need to pass any parameters to the action. The action connects to a database based on parameters passed in
environment variables.
   

## Environment variables which configure the container
This image inherits from the base TDM image. `PUBLISH_ACTION` is set in the [Dockerfile](Dockerfile) to point to
`db-log.js` script which is created by TypeScript compiler from [db-log.ts](src/db-log.ts).

When running the container, you have to define `ACTION_SECRET`.

`ACTION_SECRET` - choose a secret which you will enter when you create the Action in the UI.

This action needs to be able to connect to a database. The following variables define the DB connection:
   * `dbHost` - hostname database host - e.g. "database"
   * `dbService` - name of the Oracle service - e.g. "orcl"
   * `dbUser` - name of the Oracle user - e.g. "TRAVEL"
   * `dbPassword` - password of the user
   * `logTableName` - table into which events are logged, default is `TDM_ACTIONS_LOG_TABLE`

## To build the image locally
Use script [Docker.build.sh](Docker.build.sh).

## To run the image
Use script [Docker.run.sh](Docker.run.sh).

**Create the log table with [log-table.ddl](src/log-table.ddl) before running the action for the first time!**
