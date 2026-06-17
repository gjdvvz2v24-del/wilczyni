#!/bin/bash


for i in bash_profile pip iTerm profiles vim vimrc git-completion ; do
    rm -rf ~/.$i 2>/dev/null
    ln -sf $(pwd)/$i ~/.$i
done

mkdir -p ~/.config/powerline
ln -sf $(pwd)/config/powerline/config.json ~/.config/powerline/

git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/SirVer/ultisnips.git ~/.vim/bundle/ultisnips
git clone https://github.com/honza/vim-snippets.git ~/.vim/bundle/vim-snippets
git clone https://github.com/hashivim/vim-terraform.git ~/.vim/bundle/vim-terraform
git clone https://github.com/sebosp/vim-snippets-terraform.git ~/.vim/bundle/vim-snippets-terraform

ln -s ~/.vim/bundle/vim-snippets-terraform/terraform.snippets ~/.vim/bundle/vim-snippets/UltiSnips/

mkdir ~/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/homebrew

export PATH=~/homebrew/bin:${PATH}
brew install vim gsed mdless ccat htop oath-toolkit
