#!/bin/bash
set -e

echo "Starting Docker daemon..."
dockerd --host=unix:///var/run/docker.sock &
echo "Waiting for Docker to start..."
until docker info > /dev/null 2>&1; do
    sleep 1
done

echo "Docker is ready."

echo "Starting SSH server..."
exec /usr/local/bin/setup-sshd
