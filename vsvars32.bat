@SET VSINSTALLDIR=C:\Ken_Program_Files\Microsoft_Visual_Studio_9.0
@SET VCINSTALLDIR=C:\Ken_Program_Files\Microsoft_Visual_Studio_9.0\VC
@SET FrameworkDir=c:\Windows\Microsoft.NET\Framework
@SET FrameworkVersion=v2.0.50727
@SET Framework35Version=v3.5
@if "%VSINSTALLDIR%"=="" goto error_no_VSINSTALLDIR
@if "%VCINSTALLDIR%"=="" goto error_no_VCINSTALLDIR

@echo Setting environment for using Microsoft Visual Studio 2008 x86 tools.

@call :GetWindowsSdkDir

@if not "%WindowsSdkDir%" == "" (
	set "PATH=%WindowsSdkDir%bin;%PATH%"
	set "INCLUDE=%WindowsSdkDir%include;%INCLUDE%"
	set "LIB=%WindowsSdkDir%lib;%LIB%"
)


@rem
@rem Root of Visual Studio IDE installed files.
@rem
@set DevEnvDir=C:\Ken_Program_Files\Microsoft_Visual_Studio_9.0\Common7\IDE

@set PATH=C:\Ken_Program_Files\Microsoft_Visual_Studio_9.0\Common7\IDE;C:\Ken_Program_Files\Microsoft_Visual_Studio_9.0\VC\BIN;C:\Ken_Program_Files\Microsoft_Visual_Studio_9.0\Common7\Tools;c:\Windows\Microsoft.NET\Framework\v3.5;c:\Windows\Microsoft.NET\Framework\v2.0.50727;C:\Ken_Program_Files\Microsoft_Visual_Studio_9.0\VC\VCPackages;%PATH%
@set INCLUDE=C:\Ken_Program_Files\Microsoft_Visual_Studio_9.0\VC\INCLUDE;%INCLUDE%
@set LIB=C:\Ken_Program_Files\Microsoft_Visual_Studio_9.0\VC\LIB;%LIB%
@set LIBPATH=c:\Windows\Microsoft.NET\Framework\v3.5;c:\Windows\Microsoft.NET\Framework\v2.0.50727;C:\Ken_Program_Files\Microsoft_Visual_Studio_9.0\VC\LIB;%LIBPATH%

@goto end

:GetWindowsSdkDir
@call :GetWindowsSdkDirHelper HKLM > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkDirHelper HKCU > nul 2>&1
@if errorlevel 1 set WindowsSdkDir=%VCINSTALLDIR%\PlatformSDK\
@exit /B 0

:GetWindowsSdkDirHelper
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\Microsoft SDKs\Windows" /v "CurrentInstallFolder"') DO (
	if "%%i"=="CurrentInstallFolder" (
		SET "WindowsSdkDir=%%k"
	)
)
@if "%WindowsSdkDir%"=="" exit /B 1
@exit /B 0

:error_no_VSINSTALLDIR
@echo ERROR: VSINSTALLDIR variable is not set. 
@goto end

:error_no_VCINSTALLDIR
@echo ERROR: VCINSTALLDIR variable is not set. 
@goto end

:end
