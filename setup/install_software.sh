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

essentials="vim i3 i3status i3exit dmenu git zsh tmux conky compton pulseaudio pa-applet pavucontrol rxvt-unicode universal-ctags-git w3m wget feh rofi mutt urlview arandr dunst mlocate gnome-system-monitor tk python-pip openssh networkmanager network-manager-applet xorg lightdm lightdm-gtk-greeter qutebrowser"
optional="firefox vlc zathura cmus lyvi-git  gedit gedit-plugins dolphin libreoffice steam gimp inkscape virtualbox puddletag deluge qtiplot gnome-calculator sxiv texlive-core kalu"
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
        sudo pip install $package
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
