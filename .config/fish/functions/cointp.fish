# Defined in - @ line 1
function cointp --wraps='TERM=xterm-256color cointop' --description 'alias cointp TERM=xterm-256color cointop'
  TERM=xterm-256color cointop $argv;
end
