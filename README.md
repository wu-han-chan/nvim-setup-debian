A script (+ init.vim file) that helps with fast setup for nvim/python "ide".

This script should be installed with the command below:

------

curl -o nvim_setup.sh https://raw.githubusercontent.com/wu-han-chan/nvim-setup-debian/main/nvim_setup.sh  && chmod +x nvim_setup.sh  &&  . ./nvim_setup.sh
 
------

If you do plan on executing it some other way make sure to run it as

. ./SCRIPT_NAME.sh
or
source ./SCRIPT_NAME.sh

or it will fail. Script contains "source" (for yarn to be able to refresh the terminal session on the fly.)
If you wanna know more about it you can read it here.
https://stackoverflow.com/questions/16011245/source-files-in-a-bash-script

The script installs system level packages so you will need access to sudo.
After instalation you can modify the init.vim (~/.config/nvim/init.vim) to your needs.

This script is tested on debian 11 (5.10.0-11-amd64, kde)
Should probably work on ubuntu or other debian based systems but,
I didn't test it so don't hold my word for it.

The script expects the $HOME env variable to exist.

The only thing the script does not do is install nerd font.

You can google it its easy or use this "snippet" im using to get it.
(Didn't feel like integrating it into the script)

---------

#!/bin/sh

fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
        mkdir -p "$fonts_dir"
fi

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hermit.zip

unzip Hermit.zip -d $HOME/.local/share/fonts

fc-cache -fv

rm Hermit.zip

Youuu lazy fuk ;)
