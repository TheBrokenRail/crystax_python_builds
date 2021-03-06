#!/bin/bash

set -e

git config --global user.email $(git log -n 1 --pretty='format:%aE')
git config --global user.name $(git log -n 1 --pretty='format:%aN')

mkdir gh-pages
cp -r crystax-ndk/sources/python gh-pages
cp -r crystax-ndk/sources/openssl gh-pages

cd gh-pages
git init
git add .
git commit --quiet -m "Deploy to Github Pages [ci skip]"
git push --force "https://${GITHUB_TOKEN}@github.com/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}.git" master:gh-pages
