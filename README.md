Run from docker image
=================
Build from source
```
docker build -t=jeurboy/docker-robot-framework .
```

Run docker
```
docker run -v $(pwd)/robots/test1:/robots -e ROBOT_TESTS=/robots/ -e BROWSER=firefox jeurboy/docker-robot-framework
```

Define test case directory in param -v and change path from $(pwd)/robots/test1 to your defined path in your local computer.

Run from docker compose
====================

Checkout all project from : https://github.com/jeurboy/docker-robot-framework.git 

Edit docker-compose.yml file as follow :

```
robot-test1:
  build: .
  volumes:
    - ./robots/test1:/robots
  environment:
    - ROBOT_TESTS=/robots/
    - BROWSER=firefox
  container_name: robot-testsuite
```

Build and run

```
docker-compose build <tag-name-defined-in-docker-compose.yml-file>
docker-compose run <tag-name-defined-in-docker-compose.yml-file>
```
Example
```
docker-compose build robot-test1
docker-compose run robot-test1
```