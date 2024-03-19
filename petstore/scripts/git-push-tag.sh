#!/bin/bash

tag="$1"

cd ..
cd petstoreapp
echo "Current directory:"
pwd
git tag $tag
echo "Pushing tag to:"
git remote show origin | grep "Fetch"
git push origin $tag
echo "=============================="

cd ..
cd petstoreorderservice
echo "Current directory:"
pwd
git tag $tag
echo "Pushing tag to:"
git remote show origin | grep "Fetch"
git push origin $tag
echo "=============================="

cd ..
cd petstorepetservice
echo "Current directory:"
pwd
git tag $tag
echo "Pushing tag to:"
git remote show origin | grep "Fetch"
git push origin $tag
echo "=============================="

cd ..
cd petstoreproductservice
echo "Current directory:"
pwd
git tag $tag
echo "Pushing tag to:"
git remote show origin | grep "Fetch"
git push origin $tag
echo "=============================="

cd ..
cd petstorefunctions
echo "Current directory:"
pwd
git tag $tag
echo "Pushing tag to:"
git remote show origin | grep "Fetch"
git push origin $tag
echo "=============================="