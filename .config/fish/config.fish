source /Users/alex.caulfield/.docker/init-fish.sh || true # Added by Docker Desktop

export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"

set -x GOPATH ~/usr/local/opt/go@1.21.1/bin
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix go)/libexec"
# Put Homebrew Go first in PATH to override gvm
export PATH="$(brew --prefix go)/bin:$PATH:$GOPATH/bin"

# Allow Go to automatically download required toolchain versions
export GOTOOLCHAIN=auto

# Use the upstream official Go proxy, which is available without VPN
export GOPROXY="https://proxy.golang.org,direct"

alias g='git'
alias gs='git status'
alias gch='git checkout'
alias gnb='git checkout -b'
alias gsh='git stash'
alias gsp='git stash pop'
alias gcm='git checkout master'
alias gfm='git fetch origin master'
alias gmm='git merge origin/master'
alias gcmn='git checkout main'
alias gfmn='git fetch origin main'
alias gmmn='git merge origin/main'
alias gmc='git merge --continue'
alias gm='git merge'
alias ga='git add'
alias gpl='git pull'
alias gpo='git push origin'
alias yi='yarn install'
alias yb='yarn build'
alias ys='yarn storybook'
alias yl='yarn lint'
alias yf='yarn format'
alias y='yarn && yarn watch'
alias yt='yarn test'

function gac
  git add .
  git commit -m "$argv[1]"
end

set -x NVM_DIR ~/.nvm

# Load nvm default node version
if test -e $NVM_DIR/alias/default
  set -l nvm_version (cat $NVM_DIR/alias/default)
  set -gx PATH $NVM_DIR/versions/node/v$nvm_version/bin $PATH
end

function nvm
    bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

function yap
  yarn add "$argv[1]"
  yarn deduplicate
  yarn install
end

function yup
  yarn upgrade "$argv[1]"
  yarn deduplicate
  yarn install
end

direnv hook fish | source