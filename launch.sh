#! /bin/bash

# Get the location of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORK_VOLUME=$DIR/src
MY_UID=$(id -u)

if [ ! -d "$WORK_VOLUME" ]; then
	mkdir $WORK_VOLUME
fi

docker build -t customjupyter .



docker run -it --rm -p 8888:8888 \
	-e GRANT_SUDO=yes \
	-e NB_UID=$MY_UID \
	-v $WORK_VOLUME:/home/jovyan/work \
	customjupyter

