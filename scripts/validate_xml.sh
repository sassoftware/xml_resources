#!/bin/bash

schemaFile=$1
shift

xmllint -schema $schemaFile $@ > /dev/null
exit $?
