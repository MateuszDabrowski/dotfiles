# Config Files

.zshrc && .gitconfig && vscode settings

## oh-my-zsh

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

## zsh-syntax-highlighting

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

@.zshrc: `source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh`

## z

$`brew install z`

@.zshrc: ``. `brew --prefix`/etc/profile.d/z.sh``

## font

[Fira Code font](https://github.com/tonsky/FiraCode)

`brew tap caskroom/fonts`

`brew cask install font-fira-code`

## Powershell aliasing

```cd C:\md\Documents
md WindowsPowerShell -ErrorAction SilentlyContinue
cd WindowsPowerShell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
New-Item Microsoft.PowerShell_profile.ps1 -ItemType "file" -ErrorAction SilentlyContinue
powershell_ise.exe .\Microsoft.PowerShell_profile.ps1```
