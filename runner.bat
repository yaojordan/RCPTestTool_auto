@echo off

SET AUT=D:\tools\CXXXXXXXr_x86\CXXXXXXXr.exe
SET RUNNER=D:\tools\RCPTT_test\rcptt.runner-2.2.0\eclipse
SET PROJECT=D:\tools\RCPTT_test\rcpttWorkspace\Run_Test

SET RESULTS=D:\tools\RCPTT_test\TestResult\%version%
SET WORKSPACE=D:\tools\CXXXXXXXr_x86


REM Remove results dir if present
IF NOT EXIST %RESULTS% GOTO NORESULTS
RMDIR /S /Q %RESULTS%

:NORESULTS
md %RESULTS%

java -jar %RUNNER%/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar ^
 -application org.eclipse.rcptt.runner.headless ^
 -data %RESULTS%/runner-workspace/ ^
 -aut %AUT% ^
 -reuseExistingWorkspace %WORKSPACE%/workspace ^
 -autWsPrefix %WORKSPACE%/workspace ^
 -autConsolePrefix %RESULTS%/aut-output ^
 -htmlReport %RESULTS%/report.html ^
 -import %PROJECT% 
