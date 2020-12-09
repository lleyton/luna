local luarocks = require 'luarocks'
local config = require 'core.config'
local luarocks_cfg = require 'luarocks.core.cfg'

return function(version)
  local cfg = config.read(os.getenv('HOME') .. '/.lunarc.toml')
  luarocks.setup(cfg.versions[version])
  if cfg.variables then
    for k, v in pairs(cfg.variables) do
      luarocks_cfg.variables[k] = v
    end
  end
end