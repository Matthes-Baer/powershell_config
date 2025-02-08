# Powershell Config

This config works best on powershell 7

1. Clone this Repo in `C:\Users\<user_name>\Documents`, for example
2. Remove .git directory
3. Optionally create own repository to connect with
4. Modules to install before using:
  - `Install-Module -Name PowerShellGet -Force -Scope CurrentUser`
  - `Install-Module PSReadLine -Scope CurrentUser -Force`
  - `Install-Module posh-git -Scope CurrentUser -Force`
  - `winget install fzf`
  - `winget install ajeetdsouza.zoxide`
  - `Install-Module -Name PSFzF -RequiredVersion 2.6.1 -Scope CurrentUser`
  - `Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser`
  - `winget install JanDeDobbeleer.OhMyPosh`
  - `Install-Module posh-git -Scope CurrentUser -Force`
5. Link to the powershell_custom.ps1 file in `$PROFILE`
  - `. C:\Users\<user_name>\Documents\powershell_custom.p1`
6. Optionally, if using VS Code:
  - "Icons don't display in vs code integrated terminal after setting terminal.integrated.fontFamily" -> https://github.com/romkatv/powerlevel10k/issues/671
7. Optionally, create own oh-my-posh config and update the path
