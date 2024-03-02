#!/bin/bash

tag="$1"

cd ..
cd petstoreapp
echo "Current directory:"
pwd
git tag $tag
echo "Pushing tag to:"
git remote show origin
git push origin $tag
echo "Successfully pushed"

cd ..
cd petstoreorderservice
echo "Current directory:"
pwd
git tag $tag
echo "Pushing tag to:"
git remote show origin
git push origin $tag
echo "Successfully pushed"

cd ..
cd petstorepetservice
echo "Current directory:"
pwd
git tag $tag
echo "Pushing tag to:"
git remote show origin
git push origin $tag
echo "Successfully pushed"

cd ..
cd petstoreproductservice
echo "Current directory:"
pwd
git tag $tag
echo "Pushing tag to:"
git remote show origin
git push origin $tag
echo "Successfully pushed"