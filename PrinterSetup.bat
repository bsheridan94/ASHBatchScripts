
if not exist "C:\Users\%UserName%\Documents\scripts" md "C:\Users\%UserName%\Documents\scripts"
if exist "C:\Users\%UserName%\Documents\scripts\printer.flag" goto :eof
start \\share\sharename
echo %date% %time% %UserName% > "C:\Documents and Settings\%UserName%\scripts\printer.flag"

