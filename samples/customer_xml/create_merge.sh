#!/bin/bash
#
# Copyright (c) SAS Institute Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


validateFile=$1
discoverFile=$2

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
