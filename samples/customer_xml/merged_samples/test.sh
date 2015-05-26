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


rm -rf generated/*.xml
../../../scripts/transform_xml.sh ../../../xsl/rpath-configurator-2.0.xsl ./generated *.xml > /dev/null

for file in generated/*.xml
do
  ../../../scripts/diff_xml.sh $file golden_output/`basename $file`
  rc=$?
  if [ "$rc" -ne "0" ]; then
    break;
  fi
done

exit $rc
