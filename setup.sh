#!/usr/bin/sh
#
# setup.sh
# A shell script that installs and prepares Vim and Tmux as development tools.
#
# TODO: Could check result from shell commands and write result instead of hardcoded "Done."
# 
############################################################################################

# Just some fancy colors for terminal feedback
# --------------------------------------------
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
# --------------------------------------------

# Shell info
echo -e "${BBlue}******************************************************************"
echo -e "${BBlue}* Setting VIM and TMUX as development tools (v1.0) (fc24 and up) *"
echo -e "${BBlue}******************************************************************"
echo -e "${Color_Off}"

# Backup any existing .vimrc to .vimrc.old
echo -e "${BBlue}> Backup .vimrc to .vimrc.old and set the new one"
echo -e "${Color_Off}"
cp ~/.vimrc ~/.vimrc.old
cp .vimrc ~/.vimrc
echo -e "Done."
echo -e "${Color_Off}"

# Install powerline fonts and should set terminal to one of these patched fonts
# Using Droid Sans Mono for powerline
echo -e "${BBlue}> Install 'powerline' patched fonts..."
echo -e ">> git clone https://github.com/powerline/fonts ~./fonts"
echo -e "${Color_Off}"
git clone https://github.com/powerline/fonts ./fonts 
cd fonts/ && sh install.sh && cd ..
rm -rf fonts/
echo -e "Done."
echo -e "${Color_Off}"

# Fedora ships vi as vim-minimal, so we need to install vim-enhanced
# since F25, seems that vi is not linked to vim, must run vim instead of vi :/ ?
# Should verify if already installed...
echo -e "${BBlue}> Install vim-enhanced..."
echo -e "${Color_Off}"
sudo dnf install vim-enhanced
echo -e "Done."
echo -e "${Color_Off}"

# Install Vundle Vim plugin manager, there are others...
echo -e "${BBlue}> Install Vundle, plugin manager for vi(m)..."
echo -e ">> git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim${Color_Off}"
echo -e "${Color_Off}"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo -e "Done."
echo -e "${Color_Off}"

# Force plugin installation
echo -e "${BBlue}> Setup plugins via vundle..."
echo -e "${Color_Off}"
vim +PluginInstall +qall
echo -e "Done."
echo -e "${Color_Off}"

# Missing...
echo -e "${BBlue}> Install exuberant-ctags..."
echo -e ">> missing anjuta tags (do it manually...)"
echo -e "${Color_Off}"
echo -e "Missing..."
echo -e "Done."
echo -e "${Color_Off}"

# Install vala vim files
# Install these by cp or from github, some are files (from vala) and some colorschemes 
echo -e "${BBlue}> Install Vala vim files (ftdetect/syntax/colors)${Color_Off}"
echo -e "${Color_Off}"
mkdir ~/.vim/syntax
mkdir ~/.vim/ftdetect
mkdir ~/.vim/colors
cp .vim/syntax/vala.vim ~/.vim/syntax/vala.vim
cp .vim/ftdetect/vala.vim ~/.vim/ftdetect/vala.vim
cp .vim/colors/valloric.vim ~/.vim/colors/valloric.vim
cp .vim/colors/github.vim ~/.vim/colors/github.vim
echo -e "Done."
echo -e "${Color_Off}"

# Install TMUX
echo -e "${BBlue}> Install Tmux..."
echo -e "${Color_Off}"
sudo dnf install tmux
echo -e "Done."
echo -e "${Color_Off}"

# Backup any existing .tmux.conf to .tmux.conf.old and set the new one
echo -e "${BBlue}> Backup .tmux.conf to .tmux.conf.old and set the new one"
echo -e "${Color_Off}"
cp ~/.tmux.conf ~/.tmux.conf.old
cp .tmux.conf ~/.tmux.conf
echo -e "Done."
echo -e "${Color_Off}"
