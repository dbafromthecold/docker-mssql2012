# using my own windowsservercore image 
# this has .Net 3.5 installed which is a prerequisite for SQL Server 2012
# publicly available on the docker hub...
# docker pull dbafromthecold/windowsservercore:v1
FROM dbafromthecold/windowsservercore:v1

# create directory to hold installer and config file
RUN powershell -Command (mkdir C:\SQL2012)

# copy media into container
# media must reside in the same location as the dockerfile
COPY SQLServer2012_Dev_SP3 C:\SQL2012

# copy config file into container
# config file must also reside in the same location as the dockerfile
COPY SQLServer2012InstallConfig.ini C:\SQL2012

# install SQL Server
RUN C:\SQL2012\Setup.exe /ConfigurationFile=C:\SQL2012\SQLServer2012InstallConfig.ini

# remove install files to reduce image size
RUN powershell -Command (rm C:\SQL2012 -recurse)
