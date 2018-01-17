mono ~/Tools/ScannerMSBuild/SonarQube.Scanner.MSBuild.exe begin /d:sonar.login=XYZ /k:HETSSERVER
dotnet restore
dotnet build
dotnet test
mono ~/Tools/ScannerMSBuild/SonarQube.Scanner.MSBuild.exe end
