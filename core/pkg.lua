local luarocks = require 'luarocks'
local pkg = {}

function pkg.install(name, version)
  assert(luarocks.install(name, version, 'lua_modules', false, false))
end

function pkg.install_all(packages)
  for name, version in pairs(packages) do
    if name ~= 'lua' then
      assert(luarocks.install(name, version, 'lua_modules', false, false))
    end
  end
end

function pkg.remove(name)
  assert(luarocks.remove(name, nil, 'lua_modules'))
end

return pkg