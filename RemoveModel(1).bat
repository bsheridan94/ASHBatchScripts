::simple batch file renamer
::
::EXPLANATION - delayed variable expansion must be enabled since we want to
::expand the vars on each pass, not just once as the whole FOR loop is parsed.
::The SET command includes some simple string substitution methods (see SET /?)
::Below, I am setting newname=oldname with " (small)" substituted to ""
::The script displays what it's about to do before it does it and also supports
::dragging and dropping of the target folder.
::
@echo off
setlocal ENABLEDELAYEDEXPANSION
set folderpath=
if "%~1"=="" (
  echo No target folder was dragged ^& dropped - using local directory.
) else (
  echo Opening folder %1
  set folderpath=%1\
)
echo.
call :rename echo
echo.
echo Proceed with rename? (CTRL-C to cancel).
pause
call :rename
goto :eof
 
:rename
for %%i in (%folderpath%*.pdf) do (
  set oldname=%%~ni%%~xi
  ::to replace " Model(1)" with ""
  set newname=!oldname: Model ^(1^)=!
  %1 ren "%%~fi" "!newname!"
)
