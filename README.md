Installation:

Linux
    git clone git://github.com/rrag/dotvim.git ~/.vim

Windows
	git clone git://github.com/rrag/dotvim.git ~/vimfiles
	
	
Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

To add a submodule:

    git submodule add https://github.com/username/modulename.git bundle/modulename



To remove a submodule you need to:

- Delete the relevant section from the `.gitmodules` file.
- Stage the `.gitmodules` changes `git add .gitmodules`
- Delete the relevant section from `.git/config`
- Run `git rm --cached path_to_submodule` (no trailing slash).
- Run `rm -rf .git/modules/path_to_submodule`
- Commit `git commit -m "Removed submodule <name>"`
- Delete the now untracked submodule files `rm -rf path_to_submodule`
