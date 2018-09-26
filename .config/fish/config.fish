# fisherman bootstrap
if not test -f ~/.config/fish/functions/fisher.fish
  curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher
end

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

