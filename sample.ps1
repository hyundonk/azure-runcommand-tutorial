# URL to package.zip file (storage account URL with SAS(shared access signatures) key.
$url = 'https://storageaccountname.blob.core.windows.net/pub/package.zip?sp=r&st=2022-02-28T15:29:26Z&se=2022-03-11T23:29:26Z&spr=https&sv=2020-08-04&sr=b&sig=mP7WeURZsNKDGabulOx3Lh9mIlFHd9il9%2FXExAv04zg%3D'

$dest = 'C:\download\package.zip'

# Create directory for file download
$downloadDir = "c:\download\"
if (Test-Path $downloadDir) {
    Write-Host "Folder Exists"
}
else
{
    New-Item $downloadDir -ItemType Directory
    Write-Host "Folder Created successfully"

}
# Download zip file
$web = new-object -TypeName System.Net.WebClient
$web.DownloadFile($url, $dest)

# Extract zip file
$extractDir = 'C:\download'

$ExtShell = new-object -ComObject Shell.Application
$files = $ExtShell.Namespace($dest).Items()
$ExtShell.Namespace($extractDir).CopyHere($files)

Write-Host "Run software installation here"

Write-Host "Restart service here"

