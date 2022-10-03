function prompt {

    #Configure current user, current folder and date outputs
    $CmdPromptCurrentFolder = echo $pwd
    $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent();
    $Hostname = hostname

    # Test for Admin / Elevated
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    #Decorate the CMD Prompt
    Write-host ($(if ($IsAdmin) { 'Admin' } else { "$($CmdPromptUser.Name.split("\")[1])" })) -ForegroundColor Green -NoNewline
    Write-Host "@$Hostname" -ForegroundColor Green -NoNewline
    Write-Host ":"  -ForegroundColor White -NoNewline
    Write-Host "$CmdPromptCurrentFolder "  -ForegroundColor Blue -NoNewline
    return "> "

}
