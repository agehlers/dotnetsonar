cd ..
cd Server
mono /usr/lib/sonar-scanner/SonarQube.Scanner.MSBuild.exe begin /d:sonar.host.url=http://sonarqube-gwells-tools.pathfinder.gov.bc.ca /k:HETSSERVER
dotnet restore
dotnet build
dotnet test
mono /usr/lib/sonar-scanner/SonarQube.Scanner.MSBuild.exe end
