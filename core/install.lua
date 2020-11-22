local config = require 'core.config'

return function()
  local config = config.read()

  for i, v in pairs(config.dependencies) do
    if i ~= 'lua' then
      os.execute('luarocks install ' .. i .. ' ' .. v)
    end
  end
end