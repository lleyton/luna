local parser = require 'commands.parser'
local install = require 'core.install'

local i = parser:command('install i', 'Installs all packages')
i:argument('options', 'A list of options for installation'):args('*')

i:action(function(args)
  install(args.options or {})
end)