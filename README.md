# Config Files

.zshrc && .gitconfig && vscode settings

## Mac configuration step by step

1. Install Xcode: `xcode-select —-install`
2. Install Brew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
3. Install iTerm `brew cask install iterm2`
4. Install ZSH: `brew install zsh`
5. Install Oh-My-Zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
6. Update .zshrc: `nano ~/.zshrc` (or `code ~/.zshrc` if you have VSCode with `code` command enabled)
7. Resfresh .zshrc: `source ~/.zshrc`
8. Install zsh-autosuggestions: `git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
9. Install zsh-syntax-highlighting: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
10. Install z: `brew install z`
11. Install Fira Sans font: `brew tap caskroom/fonts` -> `brew cask install font-fira-code`
12. Enable font in iTerm2
13. Install miniconda: `brew cask install miniconda`
14. Check if miniconda initialization was saved to .zshrc instead of .bashrc
15. Install node: `brew install node`
16. Install and apply material-design-colors iTerm2 preset: <https://github.com/MartinSeeler/iterm2-material-design>

## Powershell aliasing

```cd C:\md\Documents
md WindowsPowerShell -ErrorAction SilentlyContinue
cd WindowsPowerShell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
New-Item Microsoft.PowerShell_profile.ps1 -ItemType "file" -ErrorAction SilentlyContinue
powershell_ise.exe .\Microsoft.PowerShell_profile.ps1```
