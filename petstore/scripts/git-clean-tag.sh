#!/bin/bash

tag="$1"

cd ..
cd petstoreapp
echo "Current directory:"
pwd
git tag --delete $tag
echo "Deleting tag from:"
git remote show origin | grep "Fetch"
git push --delete origin $tag
echo "=============================="

cd ..
cd petstoreorderservice
echo "Current directory:"
pwd
git tag --delete $tag
echo "Deleting tag from:"
git remote show origin | grep "Fetch"
git push --delete origin $tag
echo "=============================="

cd ..
cd petstorepetservice
echo "Current directory:"
pwd
git tag --delete $tag
echo "Deleting tag from:"
git remote show origin | grep "Fetch"
git push --delete origin $tag
echo "=============================="

cd ..
cd petstoreproductservice
echo "Current directory:"
pwd
git tag --delete $tag
echo "Deleting tag from:"
git remote show origin | grep "Fetch"
git push --delete origin $tag
echo "=============================="