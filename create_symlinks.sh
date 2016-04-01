#!/bin/bash

#arg1: the dotfile to be linked
function create_link_to_home_from_dotfiles {
    echo "Creating new symbolic link..."
    ln -s "$HOME/dotfiles/$1" "$HOME/$1"
    echo "successfully created."
}

#arg1: the dotfile link to be deleted
function remove_old_link_if_exists {
    #if symbolic link
    if [ -L "$HOME/$1" ]; then
        echo "Removing old symlink $HOME/$1 => $(readlink "$HOME/$1")"
        rm "$HOME/$1" #remove old symlink if there is any
    fi
}


#All files that should be copied:
files=($HOME/dotfiles/.*rc)
files+=("$HOME/dotfiles/.gitconfig")



#Start main script
SUCCESS=0
echo "files==${files[@]}"
for file in ${files[@]}; do
    echo ""
    basefile=$(basename $file)
    echo "Creating symlink for $basefile"
    echo "basefile=$basefile"
    remove_old_link_if_exists $basefile
    #if regular file doesn't already exist
    if [ ! -f "$HOME/$basefile" ]; then
        create_link_to_home_from_dotfiles $basefile
    else
        echo "$HOME/$basefile is a real file; remove/rename and rerun this script." 
        SUCCESS=1
    fi
done

echo ""

if [ $SUCCESS ]; then
    echo "No errors, returned SUCCESS."
else
    echo "Error code found, returned FAIL."
fi
exit $SUCCESS

