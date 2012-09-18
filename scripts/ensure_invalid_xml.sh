#!/bin/bash

schemaFile=$1
shift
inputFiles=$@

for file in $inputFiles
do
  xmllint -schema $schemaFile $file 2> /dev/null
  rc=$?
  if [ "$rc" -eq "0" ]; then
    echo "File validated when it should not have: $file"
    exit 1
  fi
done

echo "Test for invalid XML by schema passed"
exit 0
