#!/usr/bin/env bash
set fish_greeting

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user no
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
# lazygit
alias lg lazygit

# exa aliases
alias l 'exa --icons -a'
alias ls 'exa --icons'
alias ll 'exa --icons -l'
alias lla 'exa --icons -la'
alias tree 'exa --icons --tree --all'

alias g git
alias ga="git add"
alias gaa="git add ."
alias gaaa="git add -A"
alias gc="git commit -m"
alias gps="git push origin main"
alias gpl="git pull origin main"
alias nah="git reset --hard;git clean -df;"
alias gs='git status --short'


# -------
# Aliases
# -------
alias cp="cp -iv"
alias c='code .'
alias ns='npm start'
alias start='npm start'
alias nr='npm run'
alias run='npm run'
alias nis='npm i -S'
alias o="open ." # Open the current directory in Finder
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# Composer path
# set -g PATH $HOME/.composer/vendor/bin 

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end
