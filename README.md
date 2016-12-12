Configuring VI/VIM as a IDE
===========================

Will use [Vundle](https://github.com/VundleVim/Vundle.vim) (There are others!) as VI/VIM plugin manager.

```Shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

[miguel@hpforge ~]$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Cloning into '/home/miguel/.vim/bundle/Vundle.vim'...
remote: Counting objects: 3081, done.
remote: Total 3081 (delta 0), reused 0 (delta 0), pack-reused 3081
Receiving objects: 100% (3081/3081), 918.71 KiB | 980.00 KiB/s, done.
Resolving deltas: 100% (1076/1076), done.
Checking connectivity... done.
[miguel@hpforge ~]$ 
```

Some systems only have, by default, vim-minimal. To use vi/vim with more advanced features we need to install vim-enhanced.


Afterwards, copy to .vimrc to $HOMEDIR

Open vi/vim and type ```:PluginsInstall```. Restart vi/vim and it should be working!

Next we must install powerline patched fonts from https://github.com/powerline/fonts :

```Shell
[miguel@hpforge ~]$ git clone https://github.com/powerline/fonts
Cloning into 'fonts'...
remote: Counting objects: 602, done.
remote: Total 602 (delta 0), reused 0 (delta 0), pack-reused 602
Receiving objects: 100% (602/602), 12.25 MiB | 1.20 MiB/s, done.
Resolving deltas: 100% (205/205), done.
Checking connectivity... done.
[miguel@hpforge ~]$ cd fonts/
[miguel@hpforge fonts]$ ls
AnonymousPro          FiraMono       install.sh      SourceCodePro
Arimo                 Hack           LiberationMono  SymbolNeu
Cousine               Inconsolata    Meslo           Terminus
DejaVuSansMono        InconsolataDz  Monofur         Tinos
DroidSansMono         Inconsolata-g  README.rst      UbuntuMono
DroidSansMonoDotted   InputMono      RobotoMono
DroidSansMonoSlashed  install.ps1    samples
[miguel@hpforge fonts]$ ./install.sh 
Copying fonts...
Resetting font cache, this may take a moment...
All Powerline fonts installed to /home/miguel/.local/share/fonts
[miguel@hpforge fonts]$ 
```

Still missing more configs:

* vala syntax highlighting and vala support
	* inside .vim/
		* ftdetect/vala.vim
		* syntax/vala.vim
* tagbar/taglist on vala (difficult!)
* Install exuberant-ctags + anjuta-ctags (:/)
* Themes... valloric++
* TMUX Mouse mode
* Bclose (Buffer close as plugin or code on .vimrc)

powerline folder contains tmux and vim files used on FC23 @work

## Created using vi, [markdown editor](https://jbt.github.io/markdown-editor/) and ReText

Added colorschemes on .vim/Colors/ (valloric, github, flattened...)
