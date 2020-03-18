#
# bash init.sh before linking .config
#

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install commands
brew install gpg asdf ghq peco pyenv

# Install adsf-vm plugins
asdf plugin add nodejs

# Install pyenv-virtualenv
if [[ -e $(pyenv root)/plugins/pyenv-virtualenv ]]; then
  echo "$(pyenv root)/plugins/pyenv-virtualenv already exists." >&2
else
  git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

echo "Create symbolic links..."
for file in .config .gitconfig .hyper.js; do
  if [[ -e ~/${file} ]]; then
    echo "~/${file} already exists." >&2
    ls -l ~/${file}
  else
    ( cd ~; ln -s dotfiles/${file} ${file} )
    ls -l ~/${file}
  fi
done

