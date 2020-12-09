local luarocks = require 'luarocks'
local pkg = {}

function pkg.install(name, version)
  assert(luarocks.install(name, version, 'lua_modules', false, false))
end

function pkg.install_all(packages, progress_handler)
  for name, version in pairs(packages) do
    assert(luarocks.install(name, version, 'lua_modules', false, false))
    progress_handler(name, version)
  end
end

function pkg.remove(name)
  assert(luarocks.remove(name, nil, 'lua_modules'))
end

return pkg