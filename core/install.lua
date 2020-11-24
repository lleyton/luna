local config = require 'core.config'

return function()
  local content = config.read()

  for i, v in pairs(content.dependencies) do
    if i ~= 'lua' then
      -- Right now we're just invoking the install command, might want to change that :P
      os.execute('luarocks --lua-version='.. content.dependencies.lua ..' --tree lua_modules install ' .. i .. ' ' .. v)
    end
  end
end