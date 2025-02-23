oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/tokyo.json" | Invoke-Expression;
Import-Module Terminal-Icons;
Import-Module PSReadline;
Import-Module PSFzf;

# Set up FZF bindings manually for better compatibility
Set-PSReadLineKeyHandler -Chord 'Ctrl+t' -ScriptBlock { Invoke-Fzf }
Set-PSReadLineKeyHandler -Chord 'Ctrl+r' -ScriptBlock { Invoke-Fzf -History }

# Autocompletion
if ($host.name -eq 'ConsoleHost')
{
	Import-Module PSReadLine
	Set-PSReadLineOption -PredictionSource HistoryAndPlugin -PredictionViewStyle ListView
	Set-PSReadLineOption -EditMode Windows
	Set-PsReadlineOption -HistorySearchCursorMovesToEnd
	Set-PsReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
	Set-PsReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
	Set-PSReadlineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
	Set-PSReadlineOption -ShowToolTips
	Set-PSReadlineOption -PredictionSource History
	Set-PSReadlineOption -Colors @{InlinePrediction = 'DarkYellow'}
};

# Dracula readline configuration
Set-PSReadlineOption -Color @{
	"Command" = [ConsoleColor]::Green
	"Parameter" = [ConsoleColor]::Gray
	"Operator" = [ConsoleColor]::Magenta
	"Variable" = [ConsoleColor]::White
	"String" = [ConsoleColor]::Yellow
	"Number" = [ConsoleColor]::Blue
	"Type" = [ConsoleColor]::Cyan
	"Comment" = [ConsoleColor]::DarkCyan
};

# Dracula Prompt Configuration
Import-Module posh-git
$GitPromptSettings.DefaultPromptPrefix.Text = "$([char]0x2192)"; # arrow unicode symbol
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Green;
$GitPromptSettings.DefaultPromptPath.ForegroundColor = [ConsoleColor]::Cyan;
$GitPromptSettings.DefaultPromptSuffix.Text = "$([char]0x203A)"; # chevron unicode symbol
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Magenta;
# Dracula Git Status Configuration
$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Blue;
$GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Blue;
$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Blue;


function Git-Ac {
    param (
        [Parameter(Mandatory = $true)]
        [string]$m,
        [switch]$p
    )

    git add .

    git commit -m $m

    if ($p) {
        git push
    }
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })
