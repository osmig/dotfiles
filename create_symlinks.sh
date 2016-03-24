#!/bin/bash
cd ~/dotfiles
SUCCESS=0
echo "~/dotfiles/.*rc is:" ~/dotfiles/.*rc
for file in  ~/dotfiles/.*rc; do
    echo "Creating symlink for $file"
    local symfile=$(basename $file)
    #if regular file doesn't already exist
    if [ ! -f "$symfile" ]; then
        rm "~/$symfile" #remove old symlink if there is any
        ln -s "~/$symfile" "~/dotfiles/$(basename $file)"
        echo "successfully created."
    else
        echo "~/$symfile is a real file; remove/rename and rerun this script." 
        SUCCESS=1
    fi
done
if [ $SUCCESS ]; then
    echo "return SUCCESS."
else
    echo "return FAIL."
fi
exit $SUCCESS

