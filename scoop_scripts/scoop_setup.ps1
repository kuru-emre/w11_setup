# Install Scoop (if not already installed)
if (-not (Test-Path $env:USERPROFILE\scoop)) {
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
}

# Read the list of apps from the text file
$appsToInstall = Get-Content "apps.txt"

# Install each app
foreach ($app in $appsToInstall) {
    scoop install $app
}