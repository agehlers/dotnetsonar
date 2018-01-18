cd ..
cd Server
mono /usr/lib/sonar-scanner/SonarQube.Scanner.MSBuild.exe begin /d:sonar.host.url=http://172.50.150.212:9000 /k:HETSSERVER
dotnet restore
dotnet build
dotnet test
mono /usr/lib/sonar-scanner/SonarQube.Scanner.MSBuild.exe end
