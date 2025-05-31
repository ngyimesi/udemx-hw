#!/bin/sh
mkdir -p ./jenkins/home
cp -f ./jenkins/jenkins-configuration.yaml ./jenkins/home
if test -f ./jenkins/agent-key; then
  docker compose up -d
  exit 0
fi
ssh-keygen -t rsa -b 4096 -N "" -C "Jenkins agent key" -f jenkins/agent-key
key=$(awk '$1=$1' ORS='\\n' jenkins/agent-key)
pubkey=$(awk '$1=$1' ORS='\\n' jenkins/agent-key.pub)
github_key=$(awk '$1=$1' ORS='\\n' ~/.ssh/id_rsa)
echo "JENKINS_AGENT_KEY=\"$key\"" >> .env
echo "JENKINS_AGENT_PUBKEY=\"$pubkey\"" >> .env
# This assumes that the user has a valid ssh key for github
echo "GITHUB_KEY=\"$github_key\"" >> .env
docker compose up -d

