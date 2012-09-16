#!/bin/bash

file1=$1
file2=$2

diff $file1 $file2
exit $?
