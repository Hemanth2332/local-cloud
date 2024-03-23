#!/bin/bash

echo "====================================================================="

if [[ $VIRTUAL_ENV ]]
then
    echo "virtual environment is activated"
    python3 webapp/app.py

else
    echo "virtual environment directory is not found"
    exit
fi

echo "======================================================================"

if command -v nvidia-smi &> /dev/null
then
        echo 'nvidia driver is installed'

        img_check=$(docker image ls| grep tensorflow- | awk '{ print $1 }')

        if [[ "$img_check" == "tensorflow-" ]]
        then
                echo "tensorflow image built exists"
        else
                echo "tensorflow  is not built"
                echo "building the gpu image"
                echo "--------------------------------------------------------"
                docker build -t tensorflow-2.10.1  --target tfgpu -f tensorflow.dockerfile .

        fi

echo "======================================================================"

else
        echo 'nvidia driver is not installed'

        img_check=$(docker image ls| grep tensorflow- | awk '{ print $1 }')

        if [[ "$img_check" == "tensorflow-" ]]
        then
                echo "tensorflow image built exists"
        else
                echo "tensorflow  is not built"
                echo "building the gpu image"
                echo "--------------------------------------------------------"
                docker build -t tensorflow-2.10.1 --target tfcpu -f tensorflow.dockerfile .

        fi

fi

echo "====================================================================="
