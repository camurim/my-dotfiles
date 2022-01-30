# Defined in - @ line 1
function ls --wraps='exa -l --sort=mod -r --long  --header --icons' --wraps='exa -l --sort=mod -r --header --icons' --wraps='exa -l --sort=mod -r --long --header --icons' --wraps='exa -lh --sort=mod -r --long --header --icons' --wraps='exa -lh --sort=mod -r --long --header --icons --collor=aways' --wraps='exa -lh --sort=mod -r --long --header --icons --color=aways' --wraps='exa -lh --sort=mod -r --long --header --icons --color=always' --description 'alias ls exa -lh --sort=mod -r --long --header --icons --color=always'
  exa -lh --sort=mod -r --long --header --icons --color=always $argv;
end
