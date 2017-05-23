# using windows server core image
FROM dbafromthecold/windowsservercore:v1

# create directory to hold install file
RUN powershell -Command (mkdir C:\SQL2012)

# copy media into container
COPY SQLServer2012_Dev_SP3 C:\SQL2012

# copy ini file into container
COPY SQLServer2012InstallConfig.ini C:\SQL2012

# install SQL Server
RUN C:\SQL2012\Setup.exe /ConfigurationFile=C:\SQL2012\SQLServer2012InstallConfig.ini

# remove install files
RUN powershell -Command (rm C:\SQL2012 -recurse)