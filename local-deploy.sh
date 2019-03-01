#!/bin/bash
# this script is not 100% accurate but if you run 'sh ./local-deploy.sh' it will deploy on your docker locally.
echo '*********************************************************************'
echo 'Deploying Docker-Test-Service to local docker.'
'*********************************************************************'

echo '*********************************************************************'
echo 'List of Docker Containers'
echo '*********************************************************************'
docker ps

echo '*********************************************************************'
echo 'List of local Docker Images'
echo '*********************************************************************'
docker images

echo '*********************************************************************'
echo 'Killing the container'
echo '*********************************************************************'
docker kill docker-test-service

echo '*********************************************************************'
echo 'Removing the container'
echo '*********************************************************************'
docker rm docker-test-service

echo '*********************************************************************'
echo 'List of local Docker Images'
echo '*********************************************************************'
docker images

echo '*********************************************************************'
echo 'Removing the docker-test-service Image'
echo '*********************************************************************'
docker rmi docker-test-service

echo '*********************************************************************'
echo 'Verify if docker-test-service image has been deleted from the Images'
echo '*********************************************************************'
docker images

echo '*********************************************************************'
echo 'Building the docker-test-service Image'
echo '*********************************************************************'
docker build -t docker-test-service -f Dockerfile .

echo '*********************************************************************'
echo 'Verify if docker-test-service image exists.'
echo '*********************************************************************'
docker images

echo '*********************************************************************'
echo 'List of Docker Containers.'
echo '*********************************************************************'
docker ps

echo '*********************************************************************'
echo 'Create a Volumne'
echo '*********************************************************************'
docker volume create --name demo

echo '*********************************************************************'
echo 'Running container'
echo '*********************************************************************'
docker run -v demo:/demo -e  ENV="local" -e  MESSAGE="Siddharth Made This Test APP." -d -p 3000:3000 --name docker-test-service docker-test-service:latest

echo '*********************************************************************'
echo 'Copy demo to Docker Volume'
echo '*********************************************************************'
docker cp /demo/test.txt docker-test-service:/demo/test.txt