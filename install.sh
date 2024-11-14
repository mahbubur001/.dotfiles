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
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

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
