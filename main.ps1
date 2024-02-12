# MainScript.ps1

# Function to run a PowerShell script and prompt to proceed
function RunScriptWithPrompt($scriptPath) {
    Write-Host "Running script: $scriptPath"
    . $scriptPath
    $confirmation = Read-Host "Press Enter to run the next script, or 'Q' to quit"
    if ($confirmation -eq 'Q' -or $confirmation -eq 'q') {
        exit
    }
}

# Run each script with a prompt to proceed
RunScriptWithPrompt "Script1.ps1"
RunScriptWithPrompt "Script2.ps1"
RunScriptWithPrompt "Script3.ps1"