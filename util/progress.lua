local function round(num)
  if num >= 0.5 then
    return math.ceil(num)
  else
    return math.floor(num)
  end
end

local function repeat_string(str, times)
  local tmp = {}

  for i = 1, times, 1 do
    table.insert(tmp, str)
  end

  return table.concat(tmp)
end

return function(info, percentage)
  local width = 50
  local bar_amount = round(width * percentage)
  local bar = repeat_string('=', bar_amount)
  local space = repeat_string(' ', width - bar_amount)

  io.write(string.format('\r%s [%s%s]', info, bar, space))
end