local vers = require 'luarocks.core.vers'

local version = {}

function version.parse(str)
  local name, version = str:match('(.+)@(.+)')
  return name or str, version
end

function version.latest(results)
  local versions = {}

  for version, _ in pairs(results) do
    table.insert(versions, vers.parse_version(version))
  end

  table.sort(versions)
  return versions[#versions]
end

return version