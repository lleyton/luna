local TOML = require 'toml'

local config = {}

function config.read(name)
  local file = assert(io.open(name, 'r'))
  local content = TOML.parse(file:read('a'))
  file:close()
  return content
end

function config.write(name, content)
  local file = assert(io.open(name, 'w+'))
  file:write(TOML.encode(content))
  file:close()
end

return config