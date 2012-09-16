#!/bin/bash

# generate the transforms
rm -rf generated/*.xml
../../../scripts/transform_xml.sh ../../../xsl/rpath-configurator-1.0.xsl ./generated *.xml > /dev/null

for file in generated/*.xml
do
  ../../../scripts/diff_xml.sh $file golden_output/`basename $file`
  rc=$?
  if [ "$rc" -ne "0" ]; then
    break;
  fi
done

exit $rc
