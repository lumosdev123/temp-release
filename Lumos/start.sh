#!/bin/bash

echo
echo
echo ".____                                    _____                       
|    |    __ __  _____   ____  ______   /  _  \ ______ ______  ______
|    |   |  |  \/     \ /  _ \/  ___/  /  /_\  \\____ \\____ \/  ___/
|    |___|  |  /  Y Y  (  <_> )___ \  /    |    \  |_> >  |_> >___ \ 
|_______ \____/|__|_|  /\____/____  > \____|__  /   __/|   __/____  >
        \/           \/           \/          \/|__|   |__|       \/ "
echo
echo
echo "Starting Lumos Apps"

dockerVersion=$(docker --version)
echo "Found Docker version: $dockerVersion"
echo

# Check if Docker is logged in
login_status=$(docker info | grep "Username:")

if [ -z "$login_status" ]; then
    echo "You are not logged into Docker."
    read -sp "[DockerHub] Username: " dockerUsername
    read -sp "[DockerHub] Password: " dockerPass
    docker login -u $dockerUsername -p $dockerPass
else
    username=$(echo $login_status | awk '{print $2}')
    printf "[DockerHub] Logged in as: $username\n\n"
fi

# Stop previous containers
echo "Stopping old container."
docker compose down -v


# Checkk for older version of images
images=$(docker images -a | grep '^lumoscnc24' | awk '{print $3}')

if [ -z "$images" ]; then
    printf "\nNo older images available.\n"
else
    printf "\nRemoving Older images:\n"
    # Remove the images
    echo "$images" | xargs docker rmi -f
    echo "Older Images removed successfully."
fi

# Spinup new container with new images
docker compose up -d --build

printf "\nLumos Apps started successfully \U1F973 \U1F389\n"
printf "\n--------------------------------------------------------------------\n"
echo "You can access UI at below URLs:
Lumos IOT web: http://localhost:3000
Lhive Admin:   http://localhost:9082
Lform:         http://localhost:3330"
printf "\n--------------------------------------------------------------------\n"

printf "NOTE: Delete this file once the application is started.\n"
printf "\U26A0 Warning: Do not execute this file again!!.\n\n"