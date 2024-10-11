#!/bin/bash

#Set MongoDB connecting string
export DB_HOST="mongodb://10.0.3.5:27017/posts"

echo "Change directory to app"
cd repo/app
echo "In app directory"

# Stop all existing pm2 processes
pm2 stop all

echo "start"
pm2 start app.js
echo "App started with pm2"