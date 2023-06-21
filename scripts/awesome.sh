#!/bin/bash
## Based off of https://github.com/ChrisTitusTech/titus-awesome

echo "Making sure symlinks are setup..."
ln -s -f $HOME/dot_files/.config/awesome $HOME/.config/awesome

echo "Gathering needed packages..."
yay -S awesome feh variety rofi picom i3lock-fancy xclip qt5-styleplugins ttf-roboto polkit-gnome materia-theme lxappearance flameshot pnmixer network-manager-applet xfce4-power-manager qt5-styleplugins papirus-icon-theme -y

echo "Setting rofi theme..."
mkdir -p ~/.config/rofi
cp $HOME/dot_files/.config/awesome/theme/config.rasi $HOME/.config/rofi/config.rasi
sed -i '/@import/c\@import "'$HOME'/dot_files/.config/awesome/theme/sidebar.rasi"' $HOME/.config/rofi/config.rasi

sudo cat <<EOF >>"/etc/environment"
XDG_CURRENT_DESKTOP=Unity
QT_QPA_PLATFORMTHEME=gtk2
EOF
