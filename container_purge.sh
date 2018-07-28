#!/bin/bash

docker container stop docker-compose-jenkins_jenkins-master_1
docker container stop docker-compose-jenkins_jenkins-slave_1
docker container prune
