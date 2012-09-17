#!/bin/bash

file1=$1
file2=$2

echo "Diffing $file1 and $file2..."
diff $file1 $file2
exit $?
