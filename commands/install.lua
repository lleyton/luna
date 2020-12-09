local parser = require 'commands.parser'
local pkg = require 'core.pkg'
local config = require 'core.config'
local setup = require 'core.setup'
local progress = require 'util.progress'
local count = require 'util.count'

local i = parser:command('install i', 'Installs all packages')
i:argument('options', 'A list of options for installation'):args('*')

i:action(function()
  local cfg = config.read('luna.toml')
  setup(cfg.package.lua)
  local installed = 0
  local package_amount = count(cfg.dependencies)
  progress(('Installed %d/%d dependencies'):format(installed, package_amount), installed / package_amount)
  pkg.install_all(cfg.dependencies, function()
    installed = installed + 1
    progress(('Installed %d/%d dependencies'):format(installed, package_amount), installed / package_amount)
  end)

  print()
end)