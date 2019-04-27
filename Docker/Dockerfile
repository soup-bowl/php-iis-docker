FROM microsoft/iis

# Build constructs take elements of:
# https://github.com/Microsoft/iis-docker/blob/master/samples/php/Dockerfile

SHELL ["powershell", "-NoProfile -Command", "$ErrorActionPreference = 'Stop';"]

ADD https://windows.php.net/downloads/releases/php-7.3.4-nts-Win32-VC15-x64.zip php.zip
ADD https://aka.ms/vs/15/release/VC_redist.x64.exe vcr15.exe
ADD setup.ps1 setup.ps1

RUN C:\setup.ps1

#RUN C:\system32\inetsrv\appcmd.exe set config /section:system.webServer/fastCgi /+[fullPath='c:\PHP\php-cgi.exe']

WORKDIR /inetpub/wwwroot