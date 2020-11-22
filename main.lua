#!/usr/bin/env lua
package.path = [[/usr/local/Cellar/luarocks/3.4.0/share/lua/5.3/?.lua;]] .. package.path

require('luarocks.core.cfg').init()
require('luarocks.fs').init()
require('commands.load')
require('commands.parser'):parse()