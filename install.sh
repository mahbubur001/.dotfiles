# Need to set othrs app https://www.youtube.com/watch?v=GK7zLYAXdDs
#
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


#brew package install
brew install --cask google-chrome
brew install --cask alfred
brew install --cask amethyst
brew install --cask alt-tab
brew install --cask skype
brew install --cask local
brew install --cask tableplus
brew cask install iterm2
brew install zsh
brew install git
brew install neovim
brew install tmux
brew install stow
brew install node
brew install fzf
brew install --cask wezterm
brew install zoxide
brew install --cask nikitabobko/tap/aerospace # windowmanager https://www.josean.com/posts/how-to-setup-aerospace-tiling-window-manager
brew install starship
brew install zsh-autosuggestions
brew install zsh-autocomplete
brew install zsh-syntax-highlighting

# stow dotfiles
stow git
stow nvim
stow tmux
stow zsh
stow wezterm
stow aerospace


# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

upgrade_oh_my_zsh

App Clenear
# https://freemacsoft.net/appcleaner/
