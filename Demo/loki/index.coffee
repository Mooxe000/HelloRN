#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
loki = require 'lokijs'
db = new loki 'sandbox.json'
logText = -> echo "#{arguments[0]}\n"
logObject = dd
inspectObject = ->
  echo '\n'
  dd arguments

# Add a collection to the database
items = db.addCollection 'items'

# Add some documents to the collection
items.insert
  name : 'mjolnir'
  owner: 'thor'
  maker: 'dwarves'

items.insert
  name : 'gungnir'
  owner: 'odin'
  maker: 'elves'

items.insert
  name : 'tyrfing'
  owner: 'Svafrlami'
  maker: 'dwarves'

items.insert
  name : 'draupnir'
  owner: 'odin'
  maker: 'elves'

# Find and update an existing document
tyrfing = items.findOne name: 'tyrfing'
tyrfing.owner = 'arngrim'
items.update tyrfing

# These statements send to Text Output
logText 'tyrfing value :'
logObject tyrfing
logText 'odins items'
logObject items.find
  owner: 'odin'

# This statement sends to Inspector
inspectObject db
