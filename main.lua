#!/usr/bin/env lua

-- https://stackoverflow.com/questions/11714204/is-it-possible-to-make-imports-depend-on-the-location-of-my-lua-script-instead-o
local root = arg and arg[0]
if root then
  local path = root:match [[^(.+[\/])[^\/]+$]]
  if path and #path > 0 then
    package.path = path..'luarocks-api/src/?.lua;'..package.path
    package.path = path .. '?.lua;'.. package.path
  end
end

local luarocks = require 'luarocks'
luarocks.setup()

require('commands.load')
require('commands.parser'):parse()