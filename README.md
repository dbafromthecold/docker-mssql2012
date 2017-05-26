# docker-mssql2012
Dockerfile &amp; config file to create MSSQL 2012 container image

Dockerfile will create a container running SQL Server 2012 SP3 Developer Edition.

Pre-requisities: <br>
SQL Server 2012 SP3 downloaded and extracted into a folder named SQLServer2012_Dev_SP3
dbafromthecold/windowsservercore:v1 pulled from the docker hub

Build command: <br>
docker build -t sqlserver2012sp3 .
