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
brew install yarn
brew install fzf

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# stow dotfiles
stow git
stow nvim
stow tmux
stow zsh 
stow skhd

#skhd https://github.com/koekeishiya/skhd
brew install koekeishiya/formulae/skhd
brew services start skhd


# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

upgrade_oh_my_zsh





#iStat Menu 
# https://bjango.com/mac/istatmenus/
#iStat Menus for mac License
# https://gist.github.com/yutao8/bc64680dbeb5f5ba17475b5c4f717e55
# Email: 982092332@qq.com
# SN: GAWAE-FCWQ3-P8NYB-C7GF7-NEDRT-Q5DTB-MFZG6-6NEQC-CRMUD-8MZ2K-66SRB-SU8EW-EDLZ9-TGH3S-8SGA

#App Clenear
https://freemacsoft.net/appcleaner/
