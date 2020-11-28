#!/usr/bin/env sh

install()
{
	if ! type $1 > /dev/null; then
		read -p "$1 not installed, install it? (Y/N) " yn
		if [ $yn = "y" ]; then
			if type yay > /dev/null;then
				yay -S $1
			fi
			if type yaourt > /dev/null;then
				yaourt -S $1
			fi

			if type apt > /dev/null;then
				if ! type $1 > /dev/null;then
					sudo apt install $1
				fi
			fi

			if type apt-get > /dev/null;then
				if ! type $1 > /dev/null;then
					sudo apt-get install $1
				fi
			fi

			if type yum > /dev/null;then
				if ! type $1 > /dev/null;then
					sudo yum install $1
				fi
			fi

			if type zypper > /dev/null;then
				if ! type $1 > /dev/null;then
					sudo zypper install $1
				fi
			fi
		fi
	else
		echo $1 already installed
	fi
}

install_python()
{
    read -p "Install $1? (Y/N) " yn
    if [[ $yn == "y" ]]; then
        sudo pip install $1
    fi

}

essentials="vim tmux fontconfig i3 i3blocks i3exit dmenu git zsh pulseaudio pa-applet pavucontrol rxvt-unicode universal-ctags-git w3m wget feh mutt urlview arandr dunst mlocate tk python-pip openssh networkmanager network-manager-applet xorg lightdm lightdm-gtk-greeter qutebrowser sxiv " 
optional="firefox vlc zathura cmus lyvi-git gedit gedit-plugins dolphin libreoffice steam gimp inkscape virtualbox puddletag deluge qtiplot gnome-calculator texlive-core kalu"
python_packs="numpy scipy matplotlib pandas keras tensorflow progressbar "

echo "Install essential packages? [y,n]"
read installEssential
if [[ $installEssential == "y" ]]; then
    for program in $essentials; do
        install $program
    done
fi

echo ""
echo "Install Python packages? [y,n]"
read installPython
if [[ $installPython == "y" ]]; then
    for package in $python_packs; do
        install_python $package
    done
fi

echo ""
echo "Install optional Packages? [y,n]"
read installOptional
if [[ $installOptional == "y" ]]; then
    for program in $optional; do
        install $program
    done
fi
