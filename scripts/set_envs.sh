#!/bin/bash

set -e

WORKSPACE=$PWD

cd $WORKSPACE/matomo

echo "Fix correct vars for Matomo"
if [ -f .env ]
then
    echo ".env file found!"
    export $(cat .env | sed 's/#.*//g' | xargs)
else
    echo "No .env file found, you need an .env file to run this script"
fi


