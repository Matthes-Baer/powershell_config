# Powershell Config

This config works best on powershell 7

1. Clone this Repo in `C:\Users\<user_name>\Documents`, for example
2. Remove .git directory
3. Optionally create own repository to connect with
4. Modules to install before using (The `config_install.ps1` will install those for you):
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
7. Optionally, create own oh-my-posh config and update the path to load in the adjusted file
  - You can use the directory via `$env:POSH_THEMES_PATH` and put your adjusted file there if the env was already used (on Windows it points to like `C:\Users\<user_name>\AppData\Local\Programs\oh-my-posh\themes`) 
  - Or use default theme: https://ohmyposh.dev/docs/installation/windows#default-themes
8. Install Custom Font for oh-my-posh and/or set it up in the terminal: https://ohmyposh.dev/docs/installation/fonts


# Usage
- `Ctrl + r` → Opens reverse search in command history (via PSFzf)
- Up Arrow (↑) → Searches backward in history (via Set-PSReadlineKeyHandler)
- Down Arrow (↓) → Searches forward in history
- `Ctrl + t` → Opens fzf for selecting commands interactively (currently not working properly)
- Set-PSReadlineOption -PredictionSource HistoryAndPlugin → Shows command history predictions inline
- z or zi (if using zoxide) → Quickly jump to frequently used directories
  - Example: z projects (navigates to a directory named "projects" if you've visited it before)
- Git-Ac -m "commit message" → Adds all changes and commits with the specified message
  - Git-Ac -m "commit message" -p → Adds, commits, and pushes changes
- `Tab` lets you interactively search and choose from possible completions, instead of cycling through them linearly.
