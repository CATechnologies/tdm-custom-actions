# TDM Action Service Example - Echo
This action just echos parameters passed by TDM.

## TDM Variables
Optionally, when registering the action in TDM, you can pass customer parameters param1 and param2 (variables in TDM) 
and their value will be printed too.

Optionally, you can pass 2 commandline parameters to the `echo.sh` script in the `PUBLISH_ACTION` variable. 

## Environment variables which configure the container
This image inherits from the base TDM image. `PUBLISH_ACTION` is set in the [Dockerfile](Dockerfile) to point to
`echo.sh` script.

When running the container, you have to define `ACTION_SECRET`.

`ACTION_SECRET` - choose a secret which you will enter when you create the Action in the UI.

## To build the image locally
Use script [Docker.build.sh](Docker.build.sh).

Optionally, you can change version of TDM base image in [tdm.version.sh](../tdm.version.sh).

## To run the image
Use script [Docker.run.sh](Docker.run.sh).
