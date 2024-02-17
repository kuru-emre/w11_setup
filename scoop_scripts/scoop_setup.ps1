# Install Scoop (if not already installed)
if (-not (Test-Path $env:USERPROFILE\scoop)) {
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
}

# Read the list of apps from the text file
$bucketsToInstall = Get-Content "buckets.txt"
$appsToInstall = Get-Content "apps.txt"


# Install buckets
foreach ($bucket in $bucketsToInstall) {
    scoop bucket add $bucket
}

# Install each app
foreach ($app in $appsToInstall) {
    scoop install $app
}