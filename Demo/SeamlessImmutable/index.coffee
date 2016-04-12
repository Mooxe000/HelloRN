#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'

SI = require '../../src/common/immutableHelper'

sis = SI.init [
  'hello'
  'world'
]

try
  sis.push 'si'
catch ex
  sis = sis.asMutable()
  sis.push 'si'

dd sis

sis = SI.init [
  
]

# dd sis

# r = []
# for si in sis
#   r.push si.asMutable()
#
# dd r
