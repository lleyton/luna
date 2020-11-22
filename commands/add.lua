local parser = require 'commands.parser'
local config = require 'core.config'
local versions = require 'core.version'
local search = require 'luarocks.search'
local queries = require 'luarocks.queries'

local add = parser:command('add a', 'Adds a package')
add:argument('package', 'A name of a package'):args('+')

add:action(function(args)
  local config = config.read()
  for _, name in ipairs(args.package) do
    local name, version = versions.parse(name)
    local results = search.search_repos(queries.new(name), config.dependencies.lua)
    if next(results) == nil then 
      print('Could not find package: ' .. name)
      return
    end

    if version and not results[name][version] then
      print('Could not find version ' .. version .. ' for package ' .. name)
    end

    if not version then version = versions.latest(results[name]).string end
    config.dependencies[name] = version
  end
  config.write(config)
  install()
end)