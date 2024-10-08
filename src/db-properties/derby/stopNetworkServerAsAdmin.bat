@echo off

@REM Licensed to the Apache Software Foundation (ASF) under one
@REM or more contributor license agreements.  See the NOTICE file
@REM distributed with this work for additional information
@REM regarding copyright ownership.  The ASF licenses this file
@REM to you under the Apache License, Version 2.0 (the
@REM "License"); you may not use this file except in compliance
@REM with the License.  You may obtain a copy of the License at

@REM   http://www.apache.org/licenses/LICENSE-2.0

@REM Unless required by applicable law or agreed to in writing,
@REM software distributed under the License is distributed on an
@REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
@REM KIND, either express or implied.  See the License for the
@REM specific language governing permissions and limitations
@REM under the License.

@REM Next changes were added for Volunteer-HUB-DB project:
@REM - added admin username and password to stop server under admin credentials
@REM - added stopping server by admin

CALL "%~dp0derby_common.bat" %*

set USERNAME=admin
set PASSWORD=adminhubpassword

if "%_JAVACMD%"=="" goto end

if "%_USE_CLASSPATH%"=="no" goto runNoClasspath
if not "%CLASSPATH%"=="" goto runWithClasspath

:runNoClasspath
"%_JAVACMD%" %DERBY_OPTS% -classpath "%LOCALCLASSPATH%" org.apache.derby.drda.NetworkServerControl shutdown %DERBY_CMD_LINE_ARGS% -user %USERNAME% -password %PASSWORD%
goto end

:runWithClasspath
"%_JAVACMD%" %DERBY_OPTS% -classpath "%CLASSPATH%;%LOCALCLASSPATH%" org.apache.derby.drda.NetworkServerControl shutdown %DERBY_CMD_LINE_ARGS% -user %USERNAME% -password %PASSWORD%
goto end

:end
set _JAVACMD=
set DERBY_CMD_LINE_ARGS=
