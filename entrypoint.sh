#!/bin/sh -l

git clone $1

git checkout $2

yarn

cd apps/lucy

yarn dev
yarn cypress:run --browser chrome

time=$(date)
echo "::set-output name=time::$time"