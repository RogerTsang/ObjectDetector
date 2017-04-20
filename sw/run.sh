#!/bin/sh

for file in $(ls ../circle)
do
    ./main ../circle/$file
    ./main ../not\ circle/$file
done
