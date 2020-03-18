# fisherman bootstrap
# https://github.com/jorgebucaran/fisher#bootstrap-installation
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Load pyenv automatically by appending
# the following to ~/.config/fish/config.fish:

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

set -x -U GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

set -x GHQ_ROOT ~/repos
function g -d 'cd ghq'
  set repo (ghq list | peco)
  if [ "$repo" != "" ]; cd (ghq root)/$repo; end
end

# Rust
set -x PATH $HOME/.cargo/bin $PATH
source /usr/local/opt/asdf/asdf.fish
