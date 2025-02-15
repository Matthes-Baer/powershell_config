# Define PowerShell modules to install
$modules = @(
  "PowerShellGet",
  "PSReadLine",
  "posh-git",
  "PSFzF",
  "Terminal-Icons"
)

# Install PowerShell modules
foreach ($module in $modules)
{
  Write-Host "Installing PowerShell module: $module"
  Install-Module -Name $module -Force -Scope CurrentUser
}

# Install a specific version of PSFzF
Write-Host "Installing PSFzF v2.6.1"
Install-Module -Name PSFzF -RequiredVersion 2.6.1 -Scope CurrentUser -Force

# Install posh-git again to ensure the latest version
Write-Host "Reinstalling posh-git"
Install-Module posh-git -Scope CurrentUser -Force

# Define Winget applications to install
$apps = @(
  "fzf",
  "ajeetdsouza.zoxide",
  "JanDeDobbeleer.OhMyPosh"
)

# Install applications using winget
foreach ($app in $apps)
{
  Write-Host "Installing application: $app"
  winget install $app
}

Write-Host "Installation process complete!"

