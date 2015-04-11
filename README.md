# Installation
1. Clone to ~/dotfiles
2. ln -s ~/dotfiles/gitconfig ~/.gitconfig
3. ln -s ~/dotfiles/inputrc ~/.inputrc
4. ln -s ~/dotfiles/irbrc ~/.irbrc
5. Put `source ~/dotfiles/bash/init.bash` to ~/.bashrc and ensure ~/.bashrc is sourced inside ~/.bash_profile
6. ln -s ~/dotfiles/git_template ~/.git_template
7. ln -s ~/dotfiles/bash/git-sync /usr/local/bin/git-sync
8. ln -s ~/dotfiles/bash/git-ll /usr/local/bin/git-ll
9. ln -s ~/dotfiles/bash/git-delete-merged /usr/local/bin/git-delete-merged
10. ln -s ~/dotfiles/phoenix.js ~/.phoenix.js

# Dependencies

1. git
2. vim
3. bash-completion
4. hg (for Go package install)
5. ctags (for vim and git hooks)
6. Phoenix window manager

TODO: Move vim config here
