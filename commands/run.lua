local parser = require 'commands.parser'
local config = require 'core.config'

local run = parser:command('run r', 'Runs a script')
run:argument('script', 'The name of a script')

run:action(function(args)
  local content = config.read('luna.toml')

  if not content.scripts[args.script] then
    print('Script not found')
    return
  end

  assert(os.execute("PATH=\"lua_modules/bin:$PATH\" LUA_PATH='lua_modules/share/lua/".. content.dependencies.lua .."/?.lua;lua_modules/share/lua/".. content.dependencies.lua.."/?/init.lua;;' LUA_CPATH='lua_modules/lib/lua/".. content.dependencies.lua.."/?.so' " .. content.scripts[args.script]))
end)
