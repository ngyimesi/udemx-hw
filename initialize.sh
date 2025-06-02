#!/bin/sh
mkdir -p secret
if ! [ -f ./secret/github-key ]; then
	ssh-keygen -t rsa -b 4096 -f ./secret/github-key -N ""
	echo "Key generated successfully!"
	echo "Add the following public key as trusted in your GitHub account:"
	echo "----------------------------------------------------------------"
	cat ./secret/github-key.pub
	echo "----------------------------------------------------------------"
fi
echo "Key already exists."
echo "Add the following public key as trusted in your GitHub account, if you haven't done already:"
echo "-----------------------------------------------------"
cat ./secret/github-key.pub
echo "-----------------------------------------------------"
