# Defined in - @ line 1
function ls --wraps='exa -l --sort=mod -r --long  --header --icons' --wraps='exa -l --sort=mod -r --header --icons' --wraps='exa -l --sort=mod -r --long --header --icons' --wraps='exa -lh --sort=mod -r --long --header --icons' --description 'alias ls exa -lh --sort=mod -r --long --header --icons'
  exa -lh --sort=mod -r --long --header --icons $argv;
end
