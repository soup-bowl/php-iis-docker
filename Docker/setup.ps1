Expand-Archive -Path c:\php.zip -DestinationPath C:\php
Remove-Item c:\php.zip -Force
Copy-Item C:\php\php.ini-production C:\php\php.ini
setx PATH "$env:path;C:\php" -m

C:\vcr15.exe /quiet /install
dism.exe /Online /Enable-Feature /FeatureName:IIS-CGI /All