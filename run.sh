#!/bin/bash
shopt -s xpg_echo 

##########################################################
# Part 2: SET DEFAUL VARIABLES
HOST=$HOSTNAME

SHORT_DATE=`date '+%Y-%m-%d'`

TIME=`date '+%H%M'`

SCRIPT_TYPE=`basename $0 | cut -d '.' -f1` ##(get the first line of the file )

filenametime1=$(date +"%m%d%Y%H%M%S")
filenametime2=$(date +"%Y-%m-%d %H:%M:%S")
#########################################################
# Part 2: SET VARIABLES 


export PYTHON_SCRIPT_NAME=$(cat config.toml | grep 'py_script' | awk -F"=" '{print $2}' | tr -d '"') # get the py_script from config.toml, and remove the quotes
export SCRIPTS_FOLDER=$(pwd)
export LOGDIR=$SCRIPTS_FOLDER/log
export LOG_FILE=${LOGDIR}/${SHELL_SCRIPT_NAME}_${filenametime1}.log
export DOCKER_NAME=$(cat config.toml | grep 'docker_name' | awk -F"=" '{print $2}' | tr -d '"')
export INPUT_FILE=/app/input 
export OUTPUT_FILE=/app/output
#########################################################
# PART 3: GO TO SCRIPT FOLDER AND RUN
cd ${SCRIPTS_FOLDER}

#########################################################
# PART 4: SET LOG RULES

exec > >(tee ${LOG_FILE}) 2>&1

#########################################################
# PART 5: SETTING UP DOCKER ENVIRONMENT

echo "Setting up the docker environment"
docker run -d -it -v $(pwd)/input:/app/input -v $(pwd)/output:/app/output --name ${DOCKER_NAME} python:slim bash

RC1=$?
if [ ${RC1} != 0 ]; then
        echo "SETTING UP DOCKER ENVIRONMENT FAILED"
        echo "[ERROR:] RETURN CODE:  ${RC1}"
        echo "[ERROR:] REFER TO THE LOG FOR THE REASON FOR THE FAILURE."
        exit 1
fi

echo "DOCKER CONTAINER CREATED SUCCESSFULLY"

docker cp ${SCRIPTS_FOLDER}/${PYTHON_SCRIPT_NAME} ${DOCKER_NAME}:/app/${PYTHON_SCRIPT_NAME} 
docker exec ${DOCKER_NAME} pip3 install pandas

echo "DOCKER CONTAINER INSTALLED DEPENDENCIES SUCCESSFULLY!"

#########################################################
# PART 6: RUN SCRIPT

echo "\nStart to run Python Script"
docker exec ${DOCKER_NAME} python3 /app/${PYTHON_SCRIPT_NAME}


RC1=$?
if [ ${RC1} != 0 ]; then
	echo "PYTHON RUNNING FAILED"
	echo "[ERROR:] RETURN CODE:  ${RC1}"
	echo "[ERROR:] REFER TO THE LOG FOR THE REASON FOR THE FAILURE."
	exit 1
fi

echo "PROGRAM SUCCEEDED"


exit 0 
