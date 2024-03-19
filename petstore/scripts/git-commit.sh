#!/bin/bash

message="$1"

cd ..
cd petstoreapp
echo "Current directory:"
pwd
git add .
git status
git commit -m "$message"
git push
echo "=============================="

cd ..
cd petstoreorderservice
echo "Current directory:"
pwd
git add .
git status
git commit -m "$message"
git push
echo "=============================="

cd ..
cd petstorepetservice
echo "Current directory:"
pwd
git add .
git status
git commit -m "$message"
git push
echo "=============================="

cd ..
cd petstoreproductservice
echo "Current directory:"
pwd
git add .
git status
git commit -m "$message"
git push
echo "=============================="

cd ..
cd petstorefunctions
echo "Current directory:"
pwd
git add .
git status
git commit -m "$message"
git push
echo "=============================="