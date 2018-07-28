
#!/bin/bash


source ./jenkins.env

# Run a curl against the Jenkins instance installed in a Dockerfile
# to do a basic health check

set -e
set -x
jenkins_master_host="$JENKINS_URL"
time=30
echo "Wait $time seconds for Jenkins to boot"
sleep $time

echo "Curling against the Jenkins server"
echo "Should expect a 200 within 15 seconds"

STATUS_CODE=500
until [[ "$STATUS_CODE" == "200" ]]; do 
  STATUS_CODE=$(curl -sL -w "%{http_code}" $jenkins_master_host/login -o /dev/null  --max-time 15)  
done

echo "Jenkins master is up and ready to use"
docker-compose up jenkins-slave
