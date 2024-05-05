@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set list="C:\Program Files\1cv8" "C:\Program Files (x86)\1cv8" "C:\Program Files\1cv8t" "C:\Program Files (x86)\1cv8t"

for %%a in (%list%) do (
	for /d %%b in (%%a\8.3*) do (
		set c1exe="%%b\bin\1cv8.exe"
		IF EXIST !c1exe! (
			goto main
		)
		set c1exe="%%b\bin\1cv8t.exe"
		IF EXIST !c1exe! (
			goto main
		)	
	)
)
echo 1cv8.exe not found
EXIT /B

:main
echo 1cv8.exe found
echo %c1exe%

echo creating temp infobase
%c1exe% CREATEINFOBASE File="%tmp%\TempBase"

echo dump to xml
%c1exe% DESIGNER /F "%tmp%\TempBase" /DumpExternalDataProcessorOrReportToFiles РедакторКода.xml РедакторКода.epf /Out"%tmp%\TempBase\log.txt" -Format Hierarchical