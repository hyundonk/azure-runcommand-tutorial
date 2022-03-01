# azure-runcommand-tutorial

Azure Run command can be used to run powershell script inside a VM remotely.

https://docs.microsoft.com/en-us/azure/virtual-machines/windows/run-command#powershell


"sample.ps1" is sample powershell script to download a powershell scrip from remote storage (azure storage account in this example) and unzip it to "c:\download" folder.

To invoke Run command on a VM using "sample.ps1" scrip using powershell command.

```
# Install Az PowerShell module (https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-7.2.0)

PS C:\> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
PS C:\> Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force


# Login to Azure 
PS C:\> Connect-AzAccount -TenantId {enter-tenant-id-here}

# Invoke Run command
PS C:\> Invoke-AzVMRunCommand -ResourceGroupName DELETEME-AVDDEMO -Name adfs -CommandId 'RunPowerShellScript' -ScriptPath .\sample.ps1


Value[0]        :
  Code          : ComponentStatus/StdOut/succeeded
  Level         : Info
  DisplayStatus : Provisioning succeeded
  Message       :     Directory: C:\


Mode                LastWriteTime         Length Name

----                -------------         ------ ----

d-----         3/1/2022  12:42 AM                download

Folder Created successfully
Run SylinkDrop.exe here
Restart smc here


Value[1]        :
  Code          : ComponentStatus/StdErr/succeeded
  Level         : Info
  DisplayStatus : Provisioning succeeded
  Message       :
Status          : Succeeded
Capacity        : 0
Count           : 0
```

"run_command_multi.ps1" is a sample powershell script to Run commands on multiple VMs specified in a VM using "sample.ps1" scrip using powershell command. This sample script invokes run command sequencially. 
```
PS C:\> .\run_command_multi.ps1 -csvFile vmlist.csv -runScript sample.ps1

```

Above sample powershell script invoke blocking calls and each run command will be performed one after one VM sequentially. To invoke run commands using nonblocking call, use "Start-Job" to invoke run commands across multiple VMs in the background in parallel.  