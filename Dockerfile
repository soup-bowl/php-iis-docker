FROM microsoft/iis

# Build constructs take elements of:
# https://github.com/Microsoft/iis-docker/blob/master/samples/php/Dockerfile

SHELL ["powershell", "-NoProfile -Command", "$ErrorActionPreference = 'Stop';"]

ENV PHP_EXTENSIONS mysqli,pdo_mysql

ADD https://windows.php.net/downloads/releases/php-7.3.5-nts-Win32-VC15-x64.zip php.zip
ADD https://aka.ms/vs/15/release/VC_redist.x64.exe vcr15.exe
ADD setup.ps1 setup.ps1
ADD iisconf.bat iisconf.bat

RUN C:\setup.ps1
RUN cmd /c C:\iisconf.bat

WORKDIR /inetpub/wwwroot
