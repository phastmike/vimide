# Backup any existing .vimrc to .vimrc.old
echo "Backup .vimrc to .vimrc.old and set the new one..."
cp ~/.vimrc ~/.vimrc.old
cp .vimrc ~/.vimrc
echo " "

# Install powerline fonts and should set terminal to one of these patched fonts
# Using Droid Sans Mono for powerline
echo "Install 'powerline' patched fonts..."
echo "   git clone https://github.com/powerline/fonts ~./fonts"
git clone https://github.com/powerline/fonts ./fonts 
cd fonts/ && sh install.sh && cd ..

# Fedora ships vi as vim-minimal, so we need to install vim-enhanced
# since F25, seems that vi is not linked to vim, must run vim instead of vi :/
echo "Install vim-enhanced..."
sudo dnf install vim-enhanced
echo " "

# Install Vundle Vim plugin manager, there are others...
echo "Install Vundle, plugin manager for vi(m)..."
echo "   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo " "

# Force plugin installation
echo "Setup plugins via vundle..."
vim +PluginInstall +qall

# Missing...
echo "Install exuberant-ctags (missing... anjuta tags would be nice at least a warning)"
echo " "

# Install vala vim files
echo "Install Vala vim files (ftdetect/syntax)..."
mkdir ~/.vim/syntax
mkdir ~/.vim/ftdetect
cp .vim/syntax/vala.vim ~/.vim/syntax/vala.vim
cp .vim/ftdetect/vala.vim ~/.vim/ftdetect/vala.vim
echo " "

# Install these by cp or from github, some are files (from vala) and need to be added by hand (cp)
echo "install colors, ftdetect etc... (missing)"
echo " "
