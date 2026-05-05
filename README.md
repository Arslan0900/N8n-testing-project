N8n Testing Project

This project demonstrates how to automate deployment using Docker, GitHub, and n8n workflows.

🚀 Overview

The goal of this project is to:

Dockerize an application
Automatically deploy updates when code is pushed to GitHub
Use n8n to trigger deployment via webhook and SSH
🧱 Step 1: Dockerize Your Project
Create a Dockerfile for your application
Build and test your Docker container locally
Push your project code to GitHub
⚙️ Step 2: Create Deployment Script

Create a deploy.sh file in your server:

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
Make the script executable:
chmod 755 deploy.sh
🔗 Step 3: Setup n8n Workflow
Install and open n8n
Create a new workflow
Add a Webhook node
Add an SSH node
SSH Configuration:
Host: Your server IP
User: Ubuntu (or your server user)
Authentication: .pem key
Command to execute:
cd /home/ubuntu && ./deploy.sh
🔄 Step 4: Automate Deployment
Activate the workflow in n8n
Copy the webhook URL
Add the webhook URL to your GitHub repository (as a webhook trigger)

Now, whenever code is pushed to GitHub:

GitHub triggers the webhook
n8n executes the workflow
SSH runs deploy.sh on the server
Your application is automatically redeployed 🎉
✅ Result

Your deployment process is now fully automated. Every push to GitHub will trigger a fresh build and deployment of your Dockerized application.
