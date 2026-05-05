#!/bin/bash

cd /home/ubuntu/app

echo "Pull latest code"
git pull origin main

echo "Stop old container"
docker stop myapp || true
docker rm myapp || true

echo "Build new image"
docker build -t myapp .

echo "Run container"
docker run -d -p 3000:3000 --name myapp myapp
