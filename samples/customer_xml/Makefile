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


XML_FILES = $(wildcard *.xml)
SUBDIRS = invalid_samples merged_samples

all:

test: test-recurse
	../../scripts/validate_xml.sh ../../xsd/rpath-configurator-2.0.xsd $(XML_FILES)

test-recurse:
	@for i in $(SUBDIRS); do $(MAKE) -C $$i || exit 1; done
