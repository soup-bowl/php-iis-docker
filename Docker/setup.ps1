Expand-Archive -Path c:\php.zip -DestinationPath C:\php
Remove-Item c:\php.zip -Force

if (!(Test-Path C:\php\php.ini)) {
	Copy-Item C:\php\php.ini-production C:\php\php.ini

	# Enable requested PHP Extensions.
	if (Test-Path env:PHP_EXTENSIONS) {
		$phpExts = $env:PHP_EXTENSIONS.split(",")
		foreach ($phpExt in $phpExts) {
			echo $phpExt
			Add-Content -Path C:\php\php.ini -Value "extension=$phpExt"
		}
	}
}
setx PATH "$env:path;C:\php" -m

C:\vcr15.exe /quiet /install
dism.exe /Online /Enable-Feature /FeatureName:IIS-CGI /All