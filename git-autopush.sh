#!/bin/sh
git pull origin master
git add .
git commit -m "Commit Improvement and Bug Fixes at Timestamp(`date +%F-%T`)"
git push -f origin master