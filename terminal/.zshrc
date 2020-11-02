# SETTINGS

export ZSH="/Users/md/.oh-my-zsh"
export GIT_USER="MateuszDabrowski"

#-------------------------------------
# PATH CONFIGURATION
#-------------------------------------

# Python 3.6.6
export PATH="/usr/local/bin/python3.6:$PATH"

# Miniconda 3.7.3
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/md/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/md/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/md/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/md/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

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

alias aliases="cat ~/Documents/Code/Dotfiles/terminal/aliases.txt;"

#--------------------
# Edit .zshrc/aliases
#--------------------

alias zshrc="code --wait ~/.zshrc && go dot && cp ~/.zshrc ~/Documents/Code/Dotfiles/terminal && reload && go dot && git status"
alias editAliases="go dot && cd terminal && code --wait aliases.txt && go dot && git status"
alias reload=". ~/.zshrc && echo 'Config ~/.zshrc reloaded'"

#--------------------
# Show/Hide files
#--------------------

alias showFiles="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder /System/Library/CoreServices/Finder.app && echo 'Hidden files visible'"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder /System/Library/CoreServices/Finder.app && echo 'Hidden files hidden'"

#--------------------
# Homebrew aliases
#--------------------

alias brewery="brew update && brew upgrade && brew cleanup"

#--------------------
# NPM aliases
#--------------------

function nCreate() {
    # Create NodeJS Server
    npm init -y || npm init
    # Install basic packages for NodeJS
    npm i -S axios concurrently dotenv express mongoose
    npm i -D nodemon
    # Install pre-configured eslint for NodeJS
    nil
    # Update package.json for NodeJS
    json -I -f package.json -e 'this.scripts={"'"start"'": "'"node server.js"'","'"server"'": "'"nodemon server.js"'", "'"client-install"'": "'"npm i --prefix client"'", "'"client"'": "'"npm start --prefix client"'", "'"develop"'": "'"concurrently \\\"npm run server\\\" \\\"npm run client\\\""'"}'
    json -I -f package.json -e 'this.type="'"module"'"'
    json -I -f package.json -e 'this.main="'"server.js"'"'
    json -I -f package.json -e 'this.eslintConfig={"'"extends"'": ["'"md"'"]}'
    # Create .env with initial content
    echo DB_CONNECT= > .env
    # Create folder structure
    mkdir -p routes/api models client
    # Make initial files
    touch server.js ./routes/api/items.js ./models/ItemSchema.js
    # Create React App
    cd client/
    npx create-react-app .
    rm README.md
    mkdir -p src/components
    # Update package.json for React
    json -I -f package.json -e 'this.type="'"module"'"'
    json -I -f package.json -e 'this.eslintConfig={"'"extends"'": ["'"md"'"]}'
    json -I -f package.json -e 'this.proxy="'"http://localhost:5000"'"'
    cd ../
    # Create .gitignore with basic exclusions
    (echo node_modules && echo .env) > .gitignore
    # Launch git
    git init
}
alias pCreate="{ npm init -y || npm init; } && nil && json -I -f package.json -e 'this.scripts={"'"'"start"'"'": "'"'"parcel index.html"'"'","'"'"build"'"'": "'"'"parcel build index.html"'"'"}' && json -I -f package.json -e 'this.eslintConfig={"'"extends"'": ["'"md"'"]}' && json -I -f package.json -e 'this.browserslist=["'"'">0.5%"'"'", "'"'"not ie 11"'"'", "'"'"not op_mini all"'"'", "'"'"not dead"'"'"]' && npm i parcel-bundler -D && npm audit fix"
alias rCreate="npx create-react-app . && mkdir -p src/components && nil && json -I -f package.json -e 'this.eslintConfig={"'"extends"'": ["'"md"'"]}' && npm audit fix"
alias gCreate="npx gatsby new . && nil && json -I -f package.json -e 'this.eslintConfig={"'"extends"'": ["'"md"'"]}' && npm audit fix"

alias nListG="npm list -g --depth=0"
alias nList="npm list --depth=0"
alias nClean="rm package-lock.json && rm -R node_modules"
alias nil="npx install-peerdeps eslint-config-md@latest --dev"
alias nis="npm i -S"
alias nid="npm i -D"
alias nrd="(sleep 1 && open http://localhost:3000) && (npm run dev || npm run develop)"
alias nrs="npm run server"
alias nrb="npm run build"
alias ns="npm start"
alias deploy="npm run deploy"

#--------------------
# Mongo aliases
#--------------------

alias mongoStart="brew services run mongodb-community || brew services list"
alias mongoStop="brew services stop mongodb-community || brew services list"

#--------------------
# Git & Heroku aliases
#--------------------
alias gs="git status"
alias gitLog="git log --pretty=format:'%C(red)%h%C(reset) -%C(auto)%d%C(reset) %C(dim yellow)%an%C(reset)%n%C(white)%s%C(reset) %n%C(yellow)%cr »%C(reset) %C(dim yellow)%ci%C(reset)%n' --reverse"
alias gitSearch="git log --pretty=format:'%C(red)%h%C(reset) -%C(auto)%d%C(reset) %C(yellow)%an%C(reset) › %C(white)%s%C(reset) %C(yellow)%cr »%C(reset) %C(dim yellow)%ci%C(reset)' --reverse | grep -i"
function gcom() {
    if [ -n "$1" ]
        then
            git commit -m "$1"
            gitLog -3
    fi;
}
alias gpush="git push origin master"
alias gphm="git push heroku master"
alias ho="heroku open"
alias hlog="heroku logs --tail"
alias hStopWeb="heroku ps:scale web=0"
alias hStartWeb="heroku ps:scale web=1"

#--------------------
# Python aliases
#--------------------
alias py="python3.6"
alias py2="python2.7"
alias pip="pip3.6"
alias pip2="pip2.7"
alias jup="go jup && conda activate && jupyter lab && conda deactivate"
alias jupKernel="go jup && jupyter kernelspec list"
alias pyApp="py setup.py build"
alias elqPackPL="go vm && rm -rf ELQuent;cp -a /Users/md/Documents/Code/Python/ELQuent/. /Users/md/Documents/Virtual\ Machines.localized/VMShared/Code/ELQuent &&cd Elquent/utils/api && rm eloqua.p"
alias elqPackCORP="go vm && rm -rf ELQuent;cp -a /Users/md/Documents/Code/Python/ELQuent/. /Users/md/Documents/Virtual\ Machines.localized/VMShared/Code/ELQuent && cd Elquent/utils/api && rm *.p"
alias elqUpload="cp -a /Users/md/Documents/Virtual\ Machines.localized/VMShared/Code/ELQuent/build/exe.win-amd64-3.6 /Users/md/Documents/Code/Python/ELQuent/build && cp -a /Users/md/Documents/Virtual\ Machines.localized/VMShared/Code/ELQuent/build/*.zip /Users/md/Google\ Drive\ File\ Stream/My\ Drive/Apps"
alias elq="go elq && py elquent.py"
alias pipery="pip3.6 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3.6 install -U"
alias pipery2="pip2.7 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip2.7 install -U"

#--------------------
# Other aliases
#--------------------
alias vsc="open -a 'Visual Studio Code.app' ."
alias resetTouchBar="sudo pkill TouchBarServer; sudo killall ControlStrip"
alias png2webp="find ./ -type f -iname '*.png' | xargs -P 8 -I {} sh -c 'cwebp -lossless \$1 -o \"\${1%.png}.webp\"' _ {} \;"
alias jpg2webp="find ./ -type f -iname '*.jpg' | xargs -P 8 -I {} sh -c 'cwebp -lossless \$1 -o \"\${1%.jpg}.webp\"' _ {} \;"

#--------------------
# Image creation and modification
#--------------------

function prepImages() {
    if [ -n "$1" ]
        then
            res2x="$1"
            res1x=$(( res2x / 2 ))
            thumb1x=$(( res1x / 2 ))

            mkdir -p original
            mkdir -p temp
            cp *.jpg ./original
            cp *.jpg ./temp
            echo "» Creating 2x images ($res2x px)"
            mogrify -path ./ -filter Triangle -define filter:support=2 -thumbnail $res2x -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB *.jpg
            for file in *.jpg; do
                base="${file%.*}"
                mv "$file" "$base-2x.jpg"
                cwebp -lossless "$base-2x.jpg" -o "$base-2x.webp"
            done
            mkdir -p 2x
            mv *.jpg *.webp ./2x
            echo "» Creating 1x images ($res1x px)"
            cp ./temp/* ./
            mogrify -path ./ -filter Triangle -define filter:support=2 -thumbnail $res1x -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB *.jpg
            for file in *.jpg; do
                base="${file%.*}"
                mv "$file" "$base-1x.jpg"
                cwebp -lossless "$base-1x.jpg" -o "$base-1x.webp"
            done
            mkdir -p 1x
            cp *.jpg ./1x
            mv *.webp ./1x
            echo "» Creating 2x thumbs ($res1x px)"
            for file in *.jpg; do
                base="${file%-1x.*}"
                mv "$file" "$base-thumb-2x.jpg"
                cwebp -lossless "$base-thumb-2x.jpg" -o "$base-thumb-2x.webp"
            done
            mkdir -p thumb-2x
            mv *.jpg *.webp ./thumb-2x
            echo "» Creating 1x thumbs ($thumb1x px)"
            cp ./temp/* ./
            mogrify -path ./ -filter Triangle -define filter:support=2 -thumbnail $thumb1x -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB *.jpg
            for file in *.jpg; do
                base="${file%.*}"
                mv "$file" "$base-thumb-1x.jpg"
                cwebp -lossless "$base-thumb-1x.jpg" -o "$base-thumb-1x.webp"
            done
            mkdir -p thumb-1x
            mv *.jpg *.webp ./thumb-1x
            echo "» Created .jpg and .webp in: $res2x px, $res1x px, $thumb1x px"
            rm -R temp
    else
        echo "» Provide resolution for 2x image"
    fi;
}

function icon() {
    if [ -n "$1" ]
    then
        png=$(basename "$1")
        iconset="${png%.*}.iconset"
        mkdir "$iconset"

        iconutil=$(which iconutil)
        sips=$(which sips)

        echo "Processing..."
        $sips --resampleHeightWidth 16 16       "$1" --out "${iconset}/icon_16x16.png"      > /dev/null 2>&1
        $sips --resampleHeightWidth 32 32       "$1" --out "${iconset}/icon_16x16@2x.png"   > /dev/null 2>&1
        $sips --resampleHeightWidth 32 32       "$1" --out "${iconset}/icon_32x32.png"      > /dev/null 2>&1
        $sips --resampleHeightWidth 64 64       "$1" --out "${iconset}/icon_32x32@2x.png"   > /dev/null 2>&1
        $sips --resampleHeightWidth 128 128     "$1" --out "${iconset}/icon_128x128.png"    > /dev/null 2>&1
        $sips --resampleHeightWidth 256 256     "$1" --out "${iconset}/icon_128x128@2x.png" > /dev/null 2>&1
        $sips --resampleHeightWidth 256 256     "$1" --out "${iconset}/icon_256x256.png"    > /dev/null 2>&1
        $sips --resampleHeightWidth 512 512     "$1" --out "${iconset}/icon_256x256@2x.png" > /dev/null 2>&1
        $sips --resampleHeightWidth 512 512     "$1" --out "${iconset}/icon_512x512.png"    > /dev/null 2>&1
        $sips --resampleHeightWidth 1024 1024   "$1" --out "${iconset}/icon_512x512@2x.png" > /dev/null 2>&1

        $iconutil --convert icns --output "${iconset%.*}.icns" "$iconset"
        echo -e "Output file:\t${iconset%.*}.icns"
        rm -R "$iconset"
    else
        echo "» Provide .icns file name"
    fi;
}

function favicon() {
    if [ -n "$1" ]
    then
        png=$(basename "$1")
        favfolder="${png%.*}"
        mkdir "$favfolder"

        sips=$(which sips)

        echo "Processing..."
        $sips --resampleHeightWidth 16 16     "$1" --out "favicon/favicon_16.png"
        $sips --resampleHeightWidth 32 32     "$1" --out "favicon/favicon_32.png"
        $sips --resampleHeightWidth 128 128   "$1" --out "favicon/favicon_128.png"
        $sips --resampleHeightWidth 152 152   "$1" --out "favicon/favicon_152.png"
        $sips --resampleHeightWidth 167 167   "$1" --out "favicon/favicon_167.png"
        $sips --resampleHeightWidth 180 180   "$1" --out "favicon/favicon_180.png"
        $sips --resampleHeightWidth 192 192   "$1" --out "favicon/android-chrome-192x192.png"
        $sips --resampleHeightWidth 196 196   "$1" --out "favicon/favicon_196.png"
        $sips --resampleHeightWidth 270 270   "$1" --out "favicon/favicon_270.png"
        $sips --resampleHeightWidth 512 512   "$1" --out "favicon/android-chrome-512x512.png"
        convert $png -resize 48x48 favicon/favicon.ico
    else
        echo "» Provide favicon file name"
    fi;
}

#------------------
# Jump cd
#------------------

function go() {
    cd
    if [ "$1" = desk ]
	    then
	        cd Desktop; ls
    elif [ "$1" = dl ]
	    then
	        cd Downloads; ls
    elif [ "$1" = code ]
	    then
	        cd Documents/Code; ls
    elif [ "$1" = py ]
        then
            cd Documents/Code/Python; ls
    elif [ "$1" = js ]
        then
            cd Documents/Code/JS; ls
    elif [ "$1" = md ]
	      then
	          cd Documents/Code/JS/md; ls
    elif [ "$1" = aipp ]
	      then
	          cd Documents/Code/HTML/aipp; ls
    elif [ "$1" = elq ]
        then
            cd Documents/Code/Python/ELQuent; ls
    elif [ "$1" = elq2 ]
        then
            cd Documents/Code/MERN/elquent-js; ls
    elif [ "$1" = jup ]
        then
            cd Documents/Code/Python/Jupyter; ls
    elif [ "$1" = html ]
        then
            cd Documents/Code/HTML; ls
    elif [ "$1" = mjml ]
        then
            cd Documents/Code/MJML; ls
    elif [ "$1" = dot ]
        then
            cd Documents/Code/Dotfiles; ls
    elif [ "$1" = mern ]
        then
            cd Documents/Code/MERN; ls
    elif [ "$1" = tools ]
        then
            cd Documents/Code/Tools; ls
    elif [ "$1" = vm ]
        then
            cd /Users/md/Documents/Virtual\ Machines.localized/VMShared/Code/; ls
    fi
}

function lh() {
    if [ "$1" ]
    then
        if [ "$1" = s ]
        then
            if [ "$2" ]
            then
                open /Applications/Safari.app http://localhost:$2
            else
                open /Applications/Safari.app http://localhost:3000
            fi;
        elif [ "$1" = c ]
        then
            if [ "$2" ]
            then
                open /Applications/Google\ Chrome.app http://localhost:$2
            else
                open /Applications/Google\ Chrome.app http://localhost:3000
            fi;
        elif [ "$1" = f ]
        then
            if [ "$2" ]
            then
                open /Applications/Firefox\ Developer\ Edition.app http://localhost:$2
            else
                open /Applications/Firefox\ Developer\ Edition.app http://localhost:3000
            fi;
        elif [ "$1" ]
        then
            open http://localhost:$1
        fi;
    else
        open http://localhost:3000
    fi;
}

#------------------
# Find process
#------------------

function findProcess() {
    if [ "$1" ]
	    then
	        ps -ax | grep $1
    else
        ps -ax
    fi;
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"