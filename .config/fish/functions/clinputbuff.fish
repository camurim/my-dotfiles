# Defined in - @ line 1
function clinputbuff --wraps=perl\ -e\ \'use\ POSIX\;\ tcflush\(0,\ TCIFLUSH\)\;\' --description alias\ clinputbuff\ perl\ -e\ \'use\ POSIX\;\ tcflush\(0,\ TCIFLUSH\)\;\'
  perl -e 'use POSIX; tcflush(0, TCIFLUSH);' $argv;
end
