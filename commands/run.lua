local parser = require 'commands.parser'
local config = require 'core.config'

local run = parser:command('run r', 'Runs a script')
run:argument('script', 'The name of a script')

run:action(function(args)
  local content = config.read()

  if not content.scripts[args.script] then
    print('Script not found')
    return
  end

  os.execute(content.scripts[args.script])
end)
