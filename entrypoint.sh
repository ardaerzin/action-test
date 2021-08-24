#!/bin/bash

echo "Hello there $1"
time=$(date)
echo "::set-output name=time::$time"