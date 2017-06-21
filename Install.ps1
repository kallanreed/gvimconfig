Write-Host "Installing VIM files..."

$temp = "$pwd\vim_temp.zip"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile("https://github.com/kallanreed/gvimconfig/archive/master.zip", $temp)
$shell = New-Object -ComObject Shell.Application
$zip = $shell.Namespace("$temp\gvimconfig-master")

foreach ($item in $zip.Items())
{
  if ($item.Name -in @("Install.ps1", "Readme.md")) { continue }

  Write-Host "Copying $($item.Name) to $env:USERPROFILE"
  $shell.Namespace("$env:USERPROFILE").CopyHere($item)
}

Remove-Item $temp
