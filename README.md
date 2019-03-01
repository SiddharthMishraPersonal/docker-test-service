# docker-test-service
Simple ExpressJS server runs in docker container

## Dockerfile
It uses node-alpine image from docker hub and copies source code.
It exposes the port 3000 and launches the program through `start` script defined in `package.json`.

## Local Docker Deployment
The file `local-deploy.sh` contains docker commands to do following tasks:
1. Creates docker image under name `docker-test-service`.
2. Runs the docker image and creates container with the name `docker-test-service`.
3. Passes environment variables while starting container in step 2.
4. Creates a docker volume named `demo` and copies `test.txt` file from host machine's `demo` folder created at root level. (for linux/macOS).

## Web App:
Once docker container is running, you can hit `localhost:3000` to access web service running on port 3000 in docker container.

Hitting the URL will show some message on browser which includes:
1. Static message `Hello Guys, How are you!!!`.
2. Prints values for the environment variable named `ENV` and `MESSAGE`.
3. Prints the content of the `test.txt` copied in `/demo` docker volume.
