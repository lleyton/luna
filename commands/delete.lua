local parser = require 'commands.parser'
local config = require 'core.config'
local pkg = require 'core.pkg'

local delete = parser:command('delete d', 'Deletes a package')
delete:argument('package', 'A name of a package'):args('+')

delete:action(function(args)
    local cfg = config.read()
    for _, name in ipairs(args.package) do
      pkg.remove(name)
      cfg.dependencies[name] = nil
    end
    config.write(cfg)
end)