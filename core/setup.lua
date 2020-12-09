local luarocks = require 'luarocks'
local config = require 'core.config'

return function(version)
  local cfg = config.read(os.getenv('HOME') .. '/.lunarc.toml')
  luarocks.setup(cfg.versions[version])
end