/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


#brew package install

brew cask install iterm2
brew install zsh
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
stow zsh 


# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells
# use fish as default shell
sudo chsh -s "$(which zsh)" "$USER"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

upgrade_oh_my_zsh

#Install zsh-z
git clone https://github.com/agkozak/zsh-z "$ZSH_CUSTOM"/plugins/zsh-z


#install  neovim packer plugin
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

