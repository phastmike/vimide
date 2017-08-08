#!/usr/bin/sh
#
# setup.sh
# A shell script that installs and prepares Vim and Tmux as development tools.
#
# TODO: Could check result from shell commands and write result instead of
# hardcoded "Done."
# 
################################################################################

##############################################
# Just some fancy colors for terminal feedback
##############################################

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

##############################################

# This function checks the console command
# result and dumps feedback text

function check_result () {
	if [[ $1 -eq 0 ]]; then
		echo -e "[ ${BGreen}OK${Color_Off} ]"
	else
		echo -e "[${BRed}FAIL${Color_Off}]"
	fi
}

##############################################

# Shell info
echo -e "${BBlue}"
echo -e "******************************************************************"
echo -e "* Setting VIM and TMUX as development tools (v1.0) (fc24 and up) *"
echo -e "******************************************************************"
echo -e "${Color_Off}"

# Backup any existing .vimrc to .vimrc.old
echo -e "${BBlue}"
echo -e "> Backup .vimrc to .vimrc.old and set the new one"
echo -e "${Color_Off}"

echo -e -n "   - backup existing .vimrc to .vimrc.old "
cp ~/.vimrc ~/.vimrc.old 2> /dev/null
check_result $?

echo -e -n "   - push new .vimrc to local folder "
cp .vimrc ~/.vimrc 2> /dev/null
check_result $?

#echo -e "Done."
echo -e "${Color_Off}"

# Install powerline fonts and should set terminal to one of these patched fonts
# Using Droid Sans Mono for powerline
echo -e "${BBlue}> Install 'powerline' patched fonts..."
echo -e "${Color_Off}"
echo -e -n "  - clone powerline fonts from github to ~./fonts "
git clone https://github.com/powerline/fonts ./fonts > /dev/null 2> /dev/null 
check_result $?

echo -e -n "  - install fonts "
cd fonts/ 2> /dev/null && sh install.sh > /dev/null 2> /dev/null && cd ..
check_result $?

echo -e -n "  - clean dowloaded data "
rm -rf fonts/
check_result $?

echo -e "${Color_Off}"

# Fedora ships vi as vim-minimal, so we need to install vim-enhanced
# since F25, seems that vi is not linked to vim, must run vim instead of vi :/ ?
# Should verify if already installed...
echo -e "${BBlue}> Install vim-enhanced"
echo -e "${Color_Off}"
sudo dnf install vim-enhanced 2> /dev/null
check_result $?
echo -e "${Color_Off}"

# Install Vundle Vim plugin manager, there are others...
echo -e "${BBlue}> Install Vundle, plugin manager for vi(m)..."
echo -e "${Color_Off}"
echo -e -n "  - clone Vundle from github to ~/.vim/bundle/Vundle.vim "
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 2> /dev/null
check_result $?
echo -e "${Color_Off}"

# Force plugin installation
echo -e "${BBlue}> Setup plugins via vundle..."
echo -e "${Color_Off}"
vim +PluginInstall +qall 2> /dev/null
check_result $?
echo -e "${Color_Off}"

# anjuta-tags must be done manually to avoid installing anjuta for those who don't want it
echo -e "${BBlue}> Install exuberant-ctags"
echo -e "${Color_Off}"
sudo dnf install ctags 2> /dev/null
check_result $?
echo -e "${Color_Off}"

# Install vala vim files
# Install these by cp or from github, some are files (from vala) and some colorschemes 
echo -e "${BBlue}> Install Vala vim files (ftdetect/syntax/colors)"
echo -e "${Color_Off}"
echo -e -n "  - make directory ~/.vim/syntax "
mkdir ~/.vim/syntax 2> /dev/null
check_result $?
echo -e -n "  - make directory ~/.vim/syntax "
mkdir ~/.vim/ftdetect 2> /dev/null
check_result $?
echo -e -n "  - make directory ~/.vim/syntax "
mkdir ~/.vim/colors 2> /dev/null
check_result $?

echo -e -n "  - copy .vim/syntax/vala.vim ~/.vim/syntax/vala.vim "
cp .vim/syntax/vala.vim ~/.vim/syntax/vala.vim
check_result $?

echo -e -n "  - copy .vim/ftdetect/vala.vim ~/.vim/ftdetect/vala.vim "
cp .vim/ftdetect/vala.vim ~/.vim/ftdetect/vala.vim
check_result $?

echo -e -n "  - copy .vim/colors/valloric.vim ~/.vim/colors/valloric.vim "
cp .vim/colors/valloric.vim ~/.vim/colors/valloric.vim
check_result $?

echo -e -n "  - copy .vim/colors/github.vim ~/.vim/colors/github.vim "
cp .vim/colors/github.vim ~/.vim/colors/github.vim
check_result $?
echo -e "${Color_Off}"

# Install TMUX
echo -e "${BBlue}> Install Tmux..."
echo -e "${Color_Off}"
sudo dnf install tmux 2> /dev/null
check_result $?
echo -e "${Color_Off}"

# Backup any existing .tmux.conf to .tmux.conf.old and set the new one
echo -e "${BBlue}> Backup .tmux.conf to .tmux.conf.old and set the new one"
echo -e "${Color_Off}"
echo -e -n "  - backup existing tmux.conf on ~/ "
cp ~/.tmux.conf ~/.tmux.conf.old
check_result $?

echo -e -n "  - copy tmux.conf to ~/tmux.conf "
cp .tmux.conf ~/.tmux.conf 2> /dev/null
check_result $?
echo -e "${Color_Off}"

echo -e -n "${BBlue}> Dont forget to set the terminal font:"
echo -e -n "${BBlue}  Ex.: Droid Sans Mono Dotted for Powerline Regular 11"
echo -e "${Color_Off}"

echo -e -n "${BBlue}> Finished <"
echo -e "${Color_Off}"
