@echo off
REM ************************************
REM * <Basics>
REM * 	1. File: r.bat
REM * 	2. Date: 20120221_194455
REM * 	3. Author: Iwabuchi Ken
REM * <Aim>
REM * 	1. Execute ruby script file
REM * <Usage>
REM * 	1. Arguments can be used up to 6
REM * 	2. command: r <ruby file name>
REM * <Variables>
REM * 	1. arg1
REM * <File history>
REM *	1. Created: 20120131_103815
REM *
REM ************************************
REM echo off

REM ************************************
REM * No argument => show usage
REM ************************************
if "%1"=="" (
	echo ^<Usage^>
	echo   r rtuil.py
	echo   =^> ruby rtuil.py
	goto end
)

REM ***************************************
REM * Execute 'ruby' command
REM * 1. Arguments can be used up to 6
REM ***************************************
echo Execute: ruby %1 %2 %3 %4 %5 %6
ruby %1 %2 %3 %4 %5 %6

REM ************************************
REM * :end
REM ************************************
:end

REM ============ EOF ===================