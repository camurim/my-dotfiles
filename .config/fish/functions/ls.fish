# Defined in - @ line 1
function ls --wraps='exa -lmr' --wraps='ls -l --sort=mod -r --icons' --wraps='exa -l --sort=mod -r --icons' --description 'alias ls exa -l --sort=mod -r --icons'
  exa -l --sort=mod -r --icons $argv;
end
