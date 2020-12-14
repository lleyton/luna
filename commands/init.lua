local parser = require 'commands.parser'
local config = require 'core.config'

parser:command('init', 'Creates a new luna.toml'):action(function()
  config.write('luna.toml', {
    package = {
      name = 'my-new-project',
      version = '0.1.0',
      lua = '5.4'
    },
    dependencies = {},
    scripts = {
      start = 'lua main.lua'
    }
  })
end)