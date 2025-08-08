@ECHO OFF

SETLOCAL

SET "MAVEN_PROJECT_DIR=%~dp0"

IF NOT DEFINED MAVEN_HOME (
  SET "MAVEN_HOME=%MAVEN_PROJECT_DIR%.mvn\wrapper\maven-3.8.6"
)

SET "MAVEN_OPTS=%MAVEN_OPTS% -Dmaven.repo.local=\"%MAVEN_PROJECT_DIR%.mvn\wrapper\repository\""

SET "WRAPPER_JAR=%MAVEN_PROJECT_DIR%.mvn\wrapper\maven-wrapper.jar"

IF NOT EXIST "%WRAPPER_JAR%" (
    ECHO Downloading %WRAPPER_URL%
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%WRAPPER_URL%', '%WRAPPER_JAR%')"
)

"%JAVA_HOME%\bin\java" %MAVEN_OPTS% -Dmaven.multiModuleProjectDirectory="%MAVEN_PROJECT_DIR%" -Dmaven.home="%MAVEN_HOME%" -Dclassworlds.conf="%MAVEN_HOME%\bin\m2.conf" -Dmaven.ext.class.path="%MAVEN_HOME%\lib\ext\*.jar" -jar "%WRAPPER_JAR%" %*
