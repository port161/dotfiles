#!/usr/bin/env bash

cd ~/dotfiles/setup/

#vim setup 
echo "Setup Vim? [y,n]"
read setupVim
if [[ $setupVim == "y" ]]; then
    echo "Configuring Vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    mkdir -pv ~/.vim/undodir/
fi

#ranger setup
echo "Setup Ranger? [y,n]"
read setupRanger
if [[ $setupRanger == "y" ]]; then
    git clone https://github.com/ranger/ranger ~/ranger/
fi

echo "Symlink dotfiles? [y,n]"
read symlinkDots
if [[ $symlinkDots == "y" ]]; then
    #Symlink dotfiles
    echo "Symlinking dotfiles"
    ./symLinkDots.sh

    #xresources
    xrdb ~/.Xresources
fi

echo "Install software? [y,n]"
read installSoftware
if [[ $installSoftware == "y" ]]; then
    ./install_software.sh
fi

echo "Setup fonts? [y,n]"
read setupFonts
if [[ $setupFonts == "y" ]]; then
    #fonts
    mkdir -pv ~/.fonts/

    echo "Powerline? [y,n] "
    read yn
    if [[ $yn == "y" ]]; then
        echo "Downloading powerline:"
        #powerline
        cd ~/
        git clone https://github.com/powerline/fonts.git --depth=1
        ./fonts/install.sh
        rm -rf fonts
        ln -sv ~/.local/share/fonts ~/.fonts/powerline_fonts
    fi

    
    echo "Font Awesome? [y,n] "
    read yn
    if [[ $yn == "y" ]]; then
        #fontawesome
        echo "Downloading fontawesome:"
        git clone https://github.com/FortAwesome/Font-Awesome
        mv Font-Awesome/fonts/fontawesome-webfont.ttf ~/.fonts/
        rm -rf Font-Awesome
    fi

    fc-cache -fv
fi

echo "Setup default wallpaper? [y,n] "
read yn
if [[ $yn == "y" ]]; then
    mkdir -p ~/Pictures/Wallpapers/
    cp ~/dotfiles/wallpaper.jpg ~/Pictures/Wallpapers/
fi

echo ""
echo "You may wish to do the following:"
echo "Pull own git repos"
echo "Setup rclone"
