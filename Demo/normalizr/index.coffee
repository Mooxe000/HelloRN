#!/usr/bin/env coffee
require 'shelljs/make'
echo = console.log
dd = require 'ddeyes'

target.all = ->

  #  1. can normalize single entity

  target.simple()

  #  2. can normalize nested entity and delete an existing key using custom function

  target.deleteFunc()

  #  3. can update key values based on original input using a custom function

  target.updateFunc()

  #  4. can merge into entity using custom function

  target.mergeFunc()

  #  5. can normalize single entity with custom id attribute

  target.customId()

  #  6. can normalize single entity with custom id attribute function

  target.customIdFunc()

  #  7. can normalize an array

  target.simpleArray()

  #  8. can normalize a polymorphic array with schema attribute

  target.attributeArray()

  #  9. can normalize a polymorphic array with schema attribute function

  target.attributeArrayFunc()

  # 10. can normalize a map

  target.simpleMap()

  # 11. can normalize a polymorphic map with schema attribute

  target.attributeMap()

  # 12. can normalize a polymorphic map with schema attribute function

  target.attributeMapFunc()

  # 13. can normalize nested entities

  target.simpleNested()

  # 14. can normalize deeply nested entities with arrays

  target.nestedArray()

  # 15. can normalize deeply nested entities with polymorphic arrays

  target.nestedPolymorphicArray()

  # 16. can normalize deeply nested entities with maps

  target.nestedMap()

  # 17. can normalize deeply nested entities with polymorphic maps

  target.nestedPolymorphicMap()

  # 18. can normalize mutually recursive entities

  target.mutuallyRecursive()

  # 19. can normalize self-recursive entities

  target.selfRecursive()

  # 20. can merge entities

  target.merge()

  # 21. ignores prototype objects and creates new object

  target.constructNewObject()

  # 22. can normalize a polymorphic union field and array and map

  target.union()

for task in [
  'simple'
  'deleteFunc'
  'updateFunc'
  'mergeFunc'
  'customId'
  'customIdFunc'
  'simpleArray'
  'attributeArray'
  'attributeArrayFunc'
  'simpleMap'
  'attributeMap'
  'attributeMapFunc'
  'simpleNested'
  'nestedArray'
  'nestedPolymorphicArray'
  'nestedMap'
  'nestedPolymorphicMap'
  'mutuallyRecursive'
  'selfRecursive'
  'merge'
  'constructNewObject'
  'union'
]
  target[task] = require "./#{task}"
