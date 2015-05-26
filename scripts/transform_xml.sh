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
