#!/usr/bin/env sh

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
    echo "Downloading powerline:"
    mkdir -pv ~/.fonts/

    #powerline
    cd ~/
    git clone https://github.com/powerline/fonts.git --depth=1
    ./fonts/install.sh
    rm -rf fonts
    ln -sv ~/.local/share/fonts ~/.fonts/powerline_fonts

    #fontawesome
    echo "Downloading fontawesome:"
    git clone https://github.com/FortAwesome/Font-Awesome
    mv Font-Awesome/fonts/fontawesome-webfont.ttf ~/.fonts/
    rm -rf Font-Awesome

    fc-cache -fv
fi

echo ""
echo "You may wish to do the following:"
echo "Pull own git repos"
echo "Setup rclone"
