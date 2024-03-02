#!/bin/bash

tag="$1"

cd ..
cd petstoreapp
echo "Current directory:"
pwd
git tag --delete $tag
echo "Deleting tag from:"
git remote show origin
git push --delete origin $tag
echo "Successfully deleted"

cd ..
cd petstoreorderservice
echo "Current directory:"
pwd
git tag --delete $tag
echo "Deleting tag from:"
git remote show origin
git push --delete origin $tag
echo "Successfully deleted"

cd ..
cd petstorepetservice
echo "Current directory:"
pwd
git tag --delete $tag
echo "Deleting tag from:"
git remote show origin
git push --delete origin $tag
echo "Successfully deleted"

cd ..
cd petstoreproductservice
echo "Current directory:"
pwd
git tag --delete $tag
echo "Deleting tag from:"
git remote show origin
git push --delete origin $tag
echo "Successfully deleted"