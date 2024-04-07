# Local cloud deployment using docker

Environtment for learning about cloud systems at your home

## Docker installation:
        
### On linux systems:
    sudo apt install -y docker.io

### On Windows and Mac OS:
Install **WSL**. Follow https://learn.microsoft.com/en-us/windows/wsl/install for installation
Download the **docker** from the offical page https://docs.docker.com/get-docker/

## Setup

    pip install -r requirements.txt

## Run the script

    python ./cli/cli.py

## Run the webui

        python ./webui/app.py

## Warning !!
- This program runs on top of the docker api
- create a virtual environment for safe usage
- For windows users Run inside WSL

