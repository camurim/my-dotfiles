# Defined in - @ line 1
function nohup --wraps=nohup\ sh\ -c\ \"date\ +\'\%d/\%M/\%Y\ \%H:\%M:\%S\'\;\$argv\;date\ +\'\%d/\%M/\%Y\ \%H:\%M:\%S\'\"\ 2\>\&1\ \>\ nohup.log --description alias\ nohup\ nohup\ sh\ -c\ \"date\ +\'\%d/\%M/\%Y\ \%H:\%M:\%S\'\;\$argv\;date\ +\'\%d/\%M/\%Y\ \%H:\%M:\%S\'\"\ 2\>\&1\ \>\ nohup.log
 command nohup sh -c "date +'%d/%M/%Y %H:%M:%S';$argv;date +'%d/%M/%Y %H:%M:%S'" 2>&1 > nohup.log $argv;
end
