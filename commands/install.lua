local parser = require 'commands.parser'
local install = require 'core.install'

parser:command('install i', 'Installs all packages'):action(function(args)
  install()
end)