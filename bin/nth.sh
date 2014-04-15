#!/bin/bash

word=$1
first=$2
second=$3
third=$4

first=$((first-1))
second=$((second-1))
third=$((third-1))

echo ${word:$first:1} ${word:$second:1} ${word:$third:1}
