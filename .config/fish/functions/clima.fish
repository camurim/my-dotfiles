# Defined in - @ line 1
function clima --wraps='curl http://wttr.in' --description 'alias clima curl http://wttr.in'
  curl http://wttr.in $argv;
end
