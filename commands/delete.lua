local parser = require 'commands.parser'
local config = require 'core.config'
local install = require 'core.install'

local delete = parser:command('delete d', 'Deletes a package')
delete:argument('package', 'A name of a package'):args('+')

delete:action(function(args)
    local config = config.read()
    for _, name in ipairs(args.package) do
      config.dependencies[name] = nil
    end
    config.write(config)
    install()
end)