# Defined in - @ line 1
function icat --wraps='kitty +kitten icat' --wraps='kitty +kitten icat --place 1x1@95x0' --description 'alias icat kitty +kitten icat --place 1x1@95x0'
  kitty +kitten icat --place 1x1@95x0 $argv;
end
