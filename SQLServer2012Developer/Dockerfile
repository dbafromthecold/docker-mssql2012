FROM dbafromthecold/windowsservercore:v1

LABEL maintainer "Andrew Pruski"

# create directory to hold installation media
RUN powershell -Command (mkdir C:\SQL2012)

# copy media into container
COPY SQLServer2012_Dev_SP3 C:\SQL2012

# install SQL Server
RUN C:\SQL2012\Setup.exe /q /ACTION=Install /FEATURES=SQLENGINE /INSTANCENAME=MSSQLSERVER /SECURITYMODE=SQL /SAPWD=Testing11@@ /SQLSVCACCOUNT="NT AUTHORITY\System" /SQLSYSADMINACCOUNTS="BUILTIN\Administrators" /TCPENABLED=1 /IACCEPTSQLSERVERLICENSETERMS

# remove install files
RUN powershell -Command (rm C:\SQL2012 -recurse)

# make sure service is set to automatic
RUN powershell -Command (set-service MSSQLSERVER -StartupType Automatic)

# switch shell to powershell
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY start.ps1 /
WORKDIR /

ENV SA_PASSWORD _
ENV ACCEPT_EULA _

# run start.ps1
CMD .\start -sa_password $env:SA_PASSWORD -ACCEPT_EULA $env:ACCEPT_EULA -Verbose
