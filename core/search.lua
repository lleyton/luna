local vers = require 'luarocks.core.vers'
local luarocks = require 'luarocks'

local search = {}

function search.parse(str)
  local name, version = str:match('(.+)@(.+)')
  return name or str, version
end

function search.find(name)
  local results = assert(luarocks.search(name))
  local package = results.binary[name] or results.sources[name]

  return package
end

function search.latest(results)
  local versions = {}

  for version, _ in pairs(results) do
    table.insert(versions, vers.parse_version(version))
  end

  table.sort(versions)
  return versions[#versions]
end

return search