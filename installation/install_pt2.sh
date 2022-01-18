echo "installing iTerm2..."
brew install --cask iterm2
sleep 2

echo "Installing PL10K..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sleep 1

echo "Copying aliases..."
cat ../helpers/aliases.txt >> ~/.zshrc
sleep 1

echo "Installing zsh plugins..."
cd ~/.oh-my.zsh/custom/plugins

sleep 1

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH/custom/plugins/zsh-vi-mode

sleep 1
cat ../helpers/zsh_ext.txt >> ~/.zshrc

sleep 4

echo "Installing ripgrep"
brew install ripgrep

sleep 3

echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Copying vimrc..."
cat ../helpers/vim_rc.txt >> ~/.vimrc
sleep 1

exec zsh

sleep 1

p10k configure

