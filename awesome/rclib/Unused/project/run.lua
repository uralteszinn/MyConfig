function parseOutput(cmd)
  local table = {}
  local sep = " = "
  output = awful.util.pread(cmd) 
  for line in string.gmatch(output, '[^\n]+') do
    fst = string.match(line, '^(.*)' .. sep)
    snd = string.match(line, sep .. '(.*)')
    table[fst] = snd
  end
  return table
end
