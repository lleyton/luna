#!/usr/bin/env lua
package.path = [[luarocks-api/src/?.lua;]] .. package.path
local luarocks = require 'luarocks'
luarocks.setup()

require('commands.load')
require('commands.parser'):parse()