def valid_integer?(int)
  int.to_i.to_s == int
end

def minilang(commands)
  commands_arr = commands.split()
  stack = []
  register = 0
  commands_arr.each do |command|
    register = command.to_i if valid_integer?(command)
    case command
    when 'PUSH' then stack << register
    when 'ADD' then register = (stack.pop + register)
    when 'SUB' then register = (register - stack.pop)
    when 'MULT' then register = (stack.pop * register)
    when 'DIV' then register = (register / stack.pop)
    when 'MOD' then register = (register % stack.pop)
    when 'POP' then register = stack.pop
    when 'PRINT' then p register
    end
  end
end


minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)