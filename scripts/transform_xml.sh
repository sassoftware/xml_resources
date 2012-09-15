#!/bin/bash

xslFile=$1
shift
inputFiles=$@

rc=0
for file in $inputFiles
do
  xsltproc $xslFile $file > $file.transformed
  rc=$?
  if [ "$rc" -ne "0" ]; then
    break;
  fi
done

exit $rc
