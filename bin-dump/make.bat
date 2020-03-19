@echo off

SET tgt=%1
if "--%tgt%--" == "----" SET tgt=bd

REM quasi jump table
if "--%tgt%--" == "--bd--" goto make-bin-dump

echo Unknown target '%tgt%'. I know how to make these:
echo.
echo    bd - makes bin-dump.exe
goto :done

:make-bin-dump
set output=bin-dump
set c-files=bin-dump.c
set c-files=%c-files% bin-dump-main.c
goto do-build

:do-build
echo gcc -g -o %output% %c-files%
gcc -g -o tmp %c-files%
strip -o %output%.exe -g -S -d -X tmp.exe
del tmp.exe

:done