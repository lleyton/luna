local parser = require 'commands.parser'
local pkg = require 'core.pkg'
local config = require 'core.config'

local i = parser:command('install i', 'Installs all packages')
i:argument('options', 'A list of options for installation'):args('*')

i:action(function()
  local cfg = config.read()
  pkg.install_all(cfg.dependencies)
end)