@echo off

SET tgt=%1
if "--%tgt%--" == "----" SET tgt=touch

REM quasi jump table
if "--%tgt%--" == "--touch--" goto make-touch

echo Unknown target '%tgt%'. I know how to make these:
echo.
echo    touch - makes touch.exe
goto :done

:make-touch
set output=touch
set c-files=touch.c
REM set c-files=%c-files% nextfile.c
goto do-build

:do-build
echo gcc -g -o %output% %c-files%
gcc -g -o tmp %c-files%
strip -o %output%.exe -g -S -d -X tmp.exe
del tmp.exe

:done