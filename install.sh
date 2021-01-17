#!/usr/bin/env bash

echo "Installing HomeBrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Installing OhMyZSH..."
sleep 3
brew install zsh
sleep 3
brew install vim
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installing PL10K..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sleep 3
echo "Copying zshrc..."
cat zshRC.txt >> ~/.zshrc
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Copying vimrc..."
cat VimRC.txt >> ~/.vimrc
sleep 3
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
