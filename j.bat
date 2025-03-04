@echo off
REM ************************************
REM * <Basics>
REM * 	1. File: j.bat
REM * 	2. Date: 20120131_103815
REM * 	3. Author: Iwabuchi Ken
REM * <Aim>
REM * 	1. Execute java class file
REM * <Usage>
REM * 	1. Arguments can be used up to 6
REM * 	2. command: j <class file name>
REM * <Variables>
REM * 	1. arg1
REM * 	2. trunk
REM * <File history>
REM *	1. Created: 20120131_103815
REM *	2. Edited: 20120131_110106
REM *		1. L:51 => Arguments for java command
REM *			can be used
REM *	3. Edited: 20120131_110938
REM *		1. L:54 => 'ant' command added
REM ************************************
REM echo off

REM ************************************
REM * initialize vars
REM ************************************
set arg1=
set trunk=

REM ************************************
REM * No argument => show usage
REM ************************************
if "%1"=="" (
	echo ^<Usage^>
	echo   j Sub1.class
	echo   =^> java Sub1
	goto end
)

REM ***************************************
REM * Set file name from the command line
REM * arguments
REM ***************************************
set arg1=%1

REM ***************************************
REM * Get the trunk from the file name
REM * 1. Number of tokens => 2
REM * 2. delimiters => '.'

REM ***************************************

for /f "tokens=1,2 delims=." %%a in ("%arg1%") do (
	set trunk=%%a
)

REM ***************************************
REM * Execute 'java' command
REM * 1. Arguments can be used up to 6
REM ***************************************
echo Execute: java %trunk% %2 %3 %4 %5 %6
java %trunk% %2 %3 %4 %5 %6

REM ************************************
REM * :end
REM ************************************
set arg1=
set trunk=

:end

REM ============ EOF ===================