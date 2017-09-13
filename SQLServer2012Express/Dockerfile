FROM dbafromthecold/windowsservercore:v1

LABEL maintainer "Andrew Pruski"

WORKDIR /

# download media
RUN powershell -Command (Invoke-WebRequest -URI "http://download.microsoft.com/download/8/D/D/8DD7BDBA-CEF7-4D8E-8C16-D9F69527F909/ENU/x64/SQLEXPRWT_x64_ENU.exe" -OutFile setup.exe)

# install SQL Server
RUN C:\Setup.exe /q /ACTION=Install /FEATURES=SQLENGINE /INSTANCENAME=MSSQLSERVER /SECURITYMODE=SQL /SAPWD=Testing11@@ /SQLSVCACCOUNT="NT AUTHORITY\System" /SQLSYSADMINACCOUNTS="BUILTIN\Administrators" /TCPENABLED=1 /IACCEPTSQLSERVERLICENSETERMS

# remove install files to reduce image size
RUN powershell -Command (rm C:\setup.exe)

# switch shell to powershell
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY start.ps1 /

ENV SA_PASSWORD _
ENV ACCEPT_EULA _

# run start.ps1
CMD .\start -sa_password $env:SA_PASSWORD -ACCEPT_EULA $env:ACCEPT_EULA -Verbose