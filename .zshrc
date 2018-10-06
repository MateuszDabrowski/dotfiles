# SETTINGS

export ZSH="/Users/md/.oh-my-zsh"

#-------------------------------------
# BASIC CONFIGURATION
#-------------------------------------

ZSH_THEME="mh"
COMPLETION_WAITING_DOTS="true"
plugins=(git brew zsh-syntax-highlighting osx)
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. `brew --prefix`/etc/profile.d/z.sh
setopt auto_cd

#-------------------------------------
# ALIASES
#-------------------------------------

#--------------------
# Show alias list
#--------------------
alias aliases="cat ~/Documents/Code/Terminal/aliases.txt;"

#--------------------
# Edit .zshrc/aliases
#--------------------
alias zshrc="cd; cd ../md; code .zshrc; cd; cd Documents/Code/Terminal; cp ~/.zshrc ~/Documents/Code/Terminal; git status; reload"
alias editAliases="cd; cd Documents/Code/Terminal; code aliases.txt; git status"
alias reload=". ~/.zshrc && echo 'Config ~/.zshrc reloaded'"

#--------------------
# Show/Hide files
#--------------------
alias showFiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app && echo 'Hidden files visible'"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app && echo 'Hidden files hidden'"

#--------------------
# Homebrew aliases
#--------------------
alias brewery="brew update && brew upgrade && brew cleanup"

#--------------------
# Gulp aliases
#--------------------
alias bSync="cd; cd Documents/Code/HTML/Workspace; gulp run; cd"
alias gulpIni="npm install --global gulp-cli; npm install --save-dev gulp; npm init"
alias gulpInst="npm install --save-dev"

#--------------------
# Git aliases
#--------------------
alias gitLog="git log --pretty=format:'%C(red)%h%C(reset) -%C(auto)%d%C(reset) %C(dim yellow)%an%C(reset)%n%C(white)%s%C(reset) %n%C(yellow)%cr »%C(reset) %C(dim yellow)%ci%C(reset)%n' --reverse"
alias gitSearch="git log --pretty=format:'%C(red)%h%C(reset) -%C(auto)%d%C(reset) %C(yellow)%an%C(reset) › %C(white)%s%C(reset) %C(yellow)%cr »%C(reset) %C(dim yellow)%ci%C(reset)' --reverse | grep -i"

#--------------------
# Python aliases
#--------------------
alias py="python3"
alias jup="go jup;jupyter lab"
alias pyApp="py setup.py build"
alias elqPack="go vm;rm -rf ELQuent;cp -a /Users/md/Documents/Code/Python/ELQuent/. /Users/md/Documents/Virtual\ Machines.localized/VMShared/Code/ELQuent;cd Elquent/utils/api;rm eloqua.p"
alias elqDist="cp -a /Users/md/Documents/Virtual\ Machines.localized/VMShared/Code/ELQuent/build/exe.win-amd64-3.6 /Users/md/Documents/Code/Python/ELQuent/build; cp -a /Users/md/Documents/Virtual\ Machines.localized/VMShared/Code/ELQuent/build/*.zip /Users/md/Google\ Drive\ File\ Stream/My\ Drive/Aplikacje"
alias elq="cd; cd Documents/Code/Python/ELQuent/; py elquent.py"
alias pipery="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

#--------------------
# Icon creator
#--------------------
function icon() {
    if [ -n "$1" ]
        then
            mkdir $1.iconset
            sips -z 16 16     Icon.png --out $1.iconset/icon_16x16.png
            sips -z 32 32     Icon.png --out $1.iconset/icon_16x16@2x.png
            sips -z 32 32     Icon.png --out $1.iconset/icon_32x32.png
            sips -z 64 64     Icon.png --out $1.iconset/icon_32x32@2x.png
            sips -z 128 128   Icon.png --out $1.iconset/icon_128x128.png
            sips -z 256 256   Icon.png --out $1.iconset/icon_128x128@2x.png
            sips -z 256 256   Icon.png --out $1.iconset/icon_256x256.png
            sips -z 512 512   Icon.png --out $1.iconset/icon_256x256@2x.png
            sips -z 512 512   Icon.png --out $1.iconset/icon_512x512.png
            cp Icon.png $1.iconset/icon_512x512@2x.png
            iconutil --convert icns $1.iconset
            rm -R $1.iconset
    else
        echo Podaj nazwę pliku .icns
    fi;
}

#------------------
# Jump cd
#------------------
function go() {
    cd
    if [ "$1" = code ]
	then
	    cd Documents/Code; ls
    elif [ "$1" = py ]
        then
            cd Documents/Code/Python; ls
    elif [ "$1" = md ]
	      then
	          cd Documents/Code/HTML/mateuszdabrowski; ls
    elif [ "$1" = elq ]
        then
            cd Documents/Code/Python/ELQuent; ls
    elif [ "$1" = jup ]
        then
            cd Documents/Code/Python/Jupyter; ls
    elif [ "$1" = html ]
        then
            cd Documents/Code/HTML; ls
    elif [ "$1" = mjml ]
        then
            cd Documents/Code/MJML; ls
    elif [ "$1" = term ]
        then
            cd Documents/Code/Terminal; ls
    elif [ "$1" = vm ]
        then
            cd /Users/md/Documents/Virtual\ Machines.localized/VMShared/Code/; ls
    fi
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

