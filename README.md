# Config Files

.zshrc && .gitconfig && vscode settings

## Mac configuration step by step

1. Install Brew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
2. Install iTerm `brew install --cask iterm2`
3. Install ZSH: `brew install zsh`
4. Install Oh-My-Zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
5. Update .zshrc: `nano ~/.zshrc` (or `code ~/.zshrc` if you have VSCode with `code` command enabled)
6. Resfresh .zshrc: `source ~/.zshrc`
7. Install zsh-autosuggestions: `git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
8. Install zsh-syntax-highlighting: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
9. Install z: `brew install z`
10. Install Fira Sans font: `brew install --cask font-fira-code`
11. Enable font in iTerm2
12. Install node: `brew install node`
13. Install and apply material-design-colors iTerm2 preset: <https://github.com/MartinSeeler/iterm2-material-design>
14. Set git logs to output inline with cat: `git config --global core.pager cat`
15. Set git editor to use VSC: `git config --global core.editor "code --wait"`
16. Set git author: `git config --global user.name "Mateusz Dabrowski"` & `git config --global user.email "email@address.com"`

## Powershell aliasing

```cd C:\md\Documents
md WindowsPowerShell -ErrorAction SilentlyContinue
cd WindowsPowerShell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
New-Item Microsoft.PowerShell_profile.ps1 -ItemType "file" -ErrorAction SilentlyContinue
powershell_ise.exe .\Microsoft.PowerShell_profile.ps1
```
