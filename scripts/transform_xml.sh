#!/bin/bash

xslFile=$1
outputDir=$2
shift 2
inputFiles=$@

rc=0
for file in $inputFiles
do
  xsltproc $xslFile $file > $outputDir/$file
  rc=$?
  if [ "$rc" -ne "0" ]; then
    break;
  fi
done

exit $rc
