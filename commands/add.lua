local parser = require 'commands.parser'
local config = require 'core.config'
local search = require 'core.search'
local pkg = require 'core.pkg'
local setup = require 'core.setup'

local add = parser:command('add a', 'Adds a package')
add:argument('package', 'A name of a package'):args('+')

add:action(function(args)
  local cfg = config.read('luna.toml')
  setup(cfg.dependencies.lua)
  local install_queue = {}

  for _, tag in ipairs(args.package) do
    local name, version = search.parse(tag)
    local results = search.find(name)

    if not results then
      print('Could not find package: ' .. name)
      os.exit(1)
    end

    if version and not results[version] then
      print('Could not find version ' .. version .. ' for package ' .. name)
      os.exit(1)
    end

    if not version then
      version = search.latest(results).string
    end

    cfg.dependencies[name] = version
    install_queue[name] = version
  end

  for name, version in pairs(install_queue) do
    pkg.install(name, version)
  end

  config.write('luna.toml', cfg)
end)