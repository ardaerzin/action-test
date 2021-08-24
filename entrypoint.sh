#!/bin/sh -l

echo "Hello there $1"

echo "pull this $2"

git clone $2

git checkout $3

yarn

cd apps/lucy

yarn cypress:run --browser chrome

time=$(date)
echo "::set-output name=time::$time"