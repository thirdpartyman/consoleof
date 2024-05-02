@echo off

set list="C:\Program Files\1cv8" "C:\Program Files (x86)\1cv8"

for %%a in (%list%) do (
	for /d %%b in (%%a\8.3*) do (
		set c1exe="%%b\bin\1cv8.exe"
		IF EXIST %c1exe% (
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

echo make epf
%c1exe% DESIGNER /F "%tmp%\TempBase" /LoadExternalDataProcessorOrReportFromFiles РедакторКода.xml РедакторКода.epf /Out"%tmp%\TempBase\log.txt"