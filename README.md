# VIMIDE
Shell script to prepare **Vim** and **Tmux** as a simple **IDE**'like code editor with focus on [Vala](http://wiki.gnome.org/Projects/Vala) language. 

## Description
	- Using [Vundle](https://github.com/VundleVim/Vundle.vim) as Vim plugin manager.
	- Focus on Vala language (adds syntax highlighting and support)
	- anjuta-tags / ctags (Check workaround)
	- Includes 2 additional colorschemes (valloric and github)
	- Installs powerline fonts
	- Installs tmux

## Tagbar workaround
It seems anjuta-tags isn't working so here is a workaround: 
	- use anjuta-tags or ctags
	- edit bundle/tagbar/autoload/tagbar.vim as shown below:

From:
```vim
if has_key(s:ctags_types, 'vala') || executable('anjuta-tags')
  let type_vala = s:TypeInfo.New()
  let type_vala.ctagstype = 'vala' <------- Change vala
  let type_vala.kinds    
  ...
```

To:
```vim
if has_key(s:ctags_types, 'vala') || executable('anjuta-tags')
  let type_vala = s:TypeInfo.New()
  let type_vala.ctagstype = 'C#'   <------- To C#
  let type_vala.kinds    
  ...
```

This will force C# as the language used. Not the best solution but works to some extent.

## Setup
Run the shell script *`setup.sh`*.

## Powerline font

Set the terminal font to a powerline one. I've been using `Droid Sans Mono Dotted for Powerline Regular 11`
