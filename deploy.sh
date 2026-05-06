#!/bin/bash

cd /home/ubuntu/N8n-testing-project

echo "Pull latest code"
git pull origin main

echo "Stop old container"
docker stop myapp || true
docker rm myapp || true

echo "Build new image"
docker build -t myapp .

echo "Run container"
docker run -d -p 80:80 --name myapp myapp
