@echo off
SET THEFILE=C:\Users\Administrador\Documents\GitHub\JudoAttackSystemSoftware\Source\JudoAttackSystemSoftware.exe
echo Linking %THEFILE%
C:\lazarus\fpc\3.2.0\bin\x86_64-win64\ld.exe -b pei-x86-64  --gc-sections   --subsystem windows --entry=_WinMainCRTStartup    -o C:\Users\Administrador\Documents\GitHub\JudoAttackSystemSoftware\Source\JudoAttackSystemSoftware.exe C:\Users\Administrador\Documents\GitHub\JudoAttackSystemSoftware\Source\link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
