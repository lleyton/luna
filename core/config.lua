local TOML = require 'toml'

local config = {}

function config.read()
  local file = io.open('luna.toml', 'r')
  local config = TOML.parse(file:read('a'))
  file:close()
  return config
end

function config.write(config)
  local file = io.open('luna.toml', 'w+')
  file:write(TOML.encode(config))
  file:close()
end

return config