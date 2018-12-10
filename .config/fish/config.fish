# fisherman bootstrap
if not test -f ~/.config/fish/functions/fisher.fish
  curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher
end

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Load pyenv automatically by appending
# the following to ~/.config/fish/config.fish:

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

set -x -U GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

function g -d 'cd ghq'
  set repo (ghq | peco)
  if [ "$repo" != "" ]; cd (ghq root)/$repo; end
end
