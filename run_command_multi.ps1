Param (
    [Parameter(Mandatory=$true)]
    $csvFile,
    [Parameter(Mandatory=$true)]
    $runScript
)

Import-CSV $csvFile | foreach {
    Write-Host "Invoke-AzVMRunCommand -ReourceGroupName $($_.resourceGroupName) -Name  $($_.vmName) -CommandId 'RunPowerShellScript' -ScriptPath $runScript"
    Invoke-AzVMRunCommand -ResourceGroupName $_.resourceGroupName -Name $_.vmName -CommandId 'RunPowerShellScript' -ScriptPath $runScript
}
