# Defined in - @ line 1
function localip --wraps=ip\ a\ \|\ grep\ \'inet\ 172\'\ \|\ awk\ \'\{\ print\ \ \}\' --wraps=ip\ a\ \|\ grep\ \'inet\ 172\'\ \|\ awk\ \'\{\ print\ \$2\ \}\' --wraps=ip\ a\ \|\ grep\ \'inet\ 172\'\ \|\ awk\ \'\{\ print\ \ \}\'\ \|\ sed\ -e\ \'2d\' --wraps=ip\ a\ \|\ grep\ \'inet\ 172\'\ \|\ awk\ \'\{\ print\ \$2\ \}\'\ \|\ sed\ -e\ \'2d\' --description alias\ localip\ ip\ a\ \|\ grep\ \'inet\ 172\'\ \|\ awk\ \'\{\ print\ \$2\ \}\'\ \|\ sed\ -e\ \'2d\'
  ip a | grep 'inet 172' | awk '{ print $2 }' | sed -e '2d' $argv;
end
