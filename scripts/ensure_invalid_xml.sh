#!/bin/bash

schemaFile=$1
shift

xmllint -schema $schemaFile $@ 2> /dev/null
rc=$?
if [ "$rc" -ne "0" ]; then
  # succeed if xml is invalid
  echo "Test for invalid XML by schema passed"
  exit 0
fi

exit $rc
