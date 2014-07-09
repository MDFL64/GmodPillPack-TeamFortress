@echo off

set WSID=258248317

echo Please Confirm. Is everything ready?

pause
"../../../bin/gmad" create -folder . -out packaged.gma
"../../../bin/gmpublish" update -addon packaged.gma -id %WSID%
del packaged.gma
pause