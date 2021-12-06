/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


#brew package install

brew install fish
brew install git
brew install neovim
brew install tmux
brew install stow
brew install yarn
brew install fzf

# stow dotfiles
stow git
stow nvim
stow tmux
stow fish 


# add zsh as a login shell

# use fish as default shell
chsh -s "$(which fish)"

#install  neovim packer plugin
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

