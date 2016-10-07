# dotfiles
----------

##.vimrc

###Installing

####Linux
```
git clone https://github.com/felipetarijon/dotfiles/.vimrc.git ~/.vimrc
```

####Windows
```
git clone https://github.com/felipetarijon/dotfiles/.vimrc.git ~/_vimrc
```

###Configuring vimrc file

Change line 15:
```
let $WORKING_DIR = "C:/dev"
```
Working dir is where NERDTree will be opened


###Hotkeys
OBS: The leader key is ```**\|**```

| **Hotkey**         | **Action**               |
|--------------------|--------------------------|
| F8                 | Tagbar toggle            |
| F9                 | Open .vimrc file         |
| Ctrl + p           | Fuzzy finder             |
| Ctrl + Shift + Tab | Previous tab             |
| Ctrl + Tab         | Next tab                 |
| Leader + Shift + n | NERDTree toggle          |
| Leader + j         | Prettify JSON            |
| Leader + Space     | Disable highlight search |
| Ctrl + Shift + ↑   | Move a line upwards      |
| Ctrl + Shift + ↓   | Move a line downwards    |
| Ctrl + Shift + d   | Duplicate a line         |
| Ctrl + c           | Copy                     |
| Ctrl + v           | Paste                    |

----------

###Vundle - plugin manager

####How to install on Linux
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

####On Windows
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/vimfiles/bundle/Vundle.vim
```

####Installing all plugins
```
:PluginInstall
```

--------
