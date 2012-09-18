#
## Copyright (c) 2012 rPath, Inc.
#
## All rights reserved.
#

all:

test:
	$(MAKE) -C samples/customer_xml test
	$(MAKE) -C templates test
