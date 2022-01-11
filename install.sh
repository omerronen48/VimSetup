#!/usr/bin/env bash

echo "Installing HomeBrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing Vim, ZSH, & OhMyZSH..."
sleep 1
brew install zsh
sleep 1
brew install vim
sleep 1
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sleep 1

echo "installing iTerm2..."
brew install --cask iterm2
sleep 2

echo "Installing PL10K..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sleep 1

echo "Copying aliases..."
cat aliases.txt > ~/.zshrc
sleep 1

echo "Installing zsh plugins..."
cd ~/.oh-my.zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH/custom/plugins/zsh-vi-mode

cat zsh_ext.txt > ~/.zshrc

echo "Installing pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Copying vimrc..."
cat vim_rc.txt >> ~/.vimrc
sleep 1

echo "Installing vim plugins..."
cd ~/.vim/bundle
git clone https://github.com/morhetz/gruvbox
git clone https://github.com/shougo/deoplete.nvim
git clone https://github.com/valloric/youcompleteme
git clone https://github.com/tpope/vim-unimpaired
git clone https://github.com/ap/vim-css-color
git clone https://github.com/raimondi/delimitmate
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/vim-scripts/javacomplete
p10k configure
