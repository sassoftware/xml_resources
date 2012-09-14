#!/bin/bash
validateFile=merged_validation.xml
discoverFile=merged_discovery.xml

function merge_files
{
  outfile=$1
  shift
  echo "Creating merged file $outfile..."
  for file in $@
  do
    echo "  adding $file"
    cat $file >> $outfile
  done
}

echo "<validation_reports>" > $validateFile
echo "<discovery_reports>" > $discoverFile

merge_files $validateFile ./validate*.xml
merge_files $discoverFile ./discover*.xml

echo "</validation_reports>" >> $validateFile
echo "</discovery_reports>" >> $discoverFile

