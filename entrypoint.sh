#!/bin/sh -l

echo "Hello there $1"

echo "pull this $2"

git clone $2

time=$(date)
echo "::set-output name=time::$time"