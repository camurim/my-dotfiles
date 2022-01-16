# Defined in - @ line 1
function ncm --wraps='TERM=xterm-256color nccm' --description 'alias ncm TERM=xterm-256color nccm'
  TERM=xterm-256color nccm $argv;
end
