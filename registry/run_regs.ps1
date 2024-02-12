# Get the directory containing the PowerShell script
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path

# Get all .reg files in the script directory
$regFiles = Get-ChildItem -Path $scriptDirectory -Filter *.reg

# Loop through each .reg file and run it using regedit.exe with a prompt
foreach ($regFile in $regFiles) {
    Write-Host "Running registry file: $($regFile.FullName)"
    
    # Prompt the user to confirm before executing the .reg file
    $confirmation = Read-Host "Press Enter to run $($regFile.Name) or 'Q' to skip"
    if ($confirmation -eq 'Q' -or $confirmation -eq 'q') {
        Write-Host "Skipping $($regFile.Name)"
        continue  # Skip the current .reg file and proceed to the next one
    }
    
    # Run the .reg file using regedit.exe
    Start-Process regedit.exe -ArgumentList "/s `"$($regFile.FullName)`""
}