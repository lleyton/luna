local TOML = require 'toml'

local config = {}

function config.read()
  local file = io.open('luna.toml', 'r')
  local content = TOML.parse(file:read('a'))
  file:close()
  return content
end

function config.write(content)
  local file = io.open('luna.toml', 'w+')
  file:write(TOML.encode(content))
  file:close()
end

return config