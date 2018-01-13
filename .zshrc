# SETTINGS

export ZSH=/Users/mateuszdabrowski/.oh-my-zsh

#--------------------
# BASIC CONFIGURATION
#--------------------

ZSH_THEME="mh"
COMPLETION_WAITING_DOTS="true"
plugins=(git brew nom)
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. `brew --prefix`/etc/profile.d/z.sh
setopt auto_cd

#--------------------
# ALIASES
#--------------------

#--------------------
# Show alias list
#--------------------
alias aliases="cd; cd Documents/Code/Terminal; cat aliases.txt; cd"
alias gitAliases="cd; cd Documents/Code/Terminal; cat git.txt; cd"
alias pyAliases="cd; cd Documents/Code/Terminal; cat py.txt; cd"

#--------------------
# Edit .zshrc/aliases
#--------------------
alias zshrc="cd; cd ../mateuszdabrowski; nano .zshrc; cd; zshrcGit"
alias zshrcGit="cd; cp .zshrc Documents/Code/Terminal; cd Documents/Code/Terminal; git status"
alias editGitAliases="cd; cd Documents/Code/Terminal; nano git.txt; cd"
alias editPyAliases="cd; cd Documents/Code/Terminal; nano py.txt; cd"
alias editAliases="cd; cd Documents//Code/Terminal; nano aliases.txt; cd"
alias reload=". ~/.zshrc && echo 'Config ~/.zshrc reloaded'"

#--------------------
# Show/Hide files
#--------------------
alias showFiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app && echo 'Hidden files visible'"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app && echo 'Hidden files hidden'"

#--------------------
# Gulp aliases
#--------------------
alias bSync="cd; cd Documents/Code/HTML/Website; gulp run; cd"
alias gulpIni="npm install --global gulp-cli; npm install --save-dev gulp; npm init"
alias gulpInst="npm install --save-dev"

function alert() {
    cd
    cd Documents/Code/HTML/Email/Alert_MJML/
    if [ -n "$2" ]
    then
        gulp $1 --$2
    else
        echo Alert:: test/run  ala/ak/ao/aap/all
    fi
    cd;
}

function nsl() {
    cd
    cd Documents/Code/HTML/Email/Newsletter_MJML/
    if [ -n "$2" ]
    then
        gulp $1 --$2
    else
        echo Newsletter:: test/run npb/all
    fi
    cd;
}

#--------------------
# Python aliases
#--------------------
alias py="python3"
alias pyApp="pyinstaller --onefile --clean *.spec"

function wk() {
    cd
    cd Documents/Code/Python/WK/
    if [ -n "$1" ]
    then
        py wk.py $1
    else
        py wk.py
    fi
    cd ../;
}

function pyExe() { 
    cp *.py ./src
    cp *.spec ./src
    docker run -v "$(pwd):/src/" cdrx/pyinstaller-windows
    cd ./dist/windows
    cp *.exe ../
    cd ../
    rm -R ./windows
    cd ../;
}

#--------------------
# Other functions
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
