#!/bin/bash

### --- Install everything --- ###

# AUR folder for yay and other AUR packages

mkdir ~/AUR
cd ~/AUR

### Enable multilib repo ###

sudo nano /etc/pacman.conf
sudo pacman -Sy

### Updates ###

sudo pacman -Syu --noconfirm

### Shell ###

# zsh & pluggins

sudo pacman -S --noconfirm zsh zsh-syntax-highlighting zsh-autosuggestions

## configs (credits to chris titus tech)

wget https://github.com/ChrisTitusTech/zsh/raw/master/.zshrc -O ~/.zshrc
mkdir -p "$HOME/.zsh"
wget https://github.com/ChrisTitusTech/zsh/raw/master/.zsh/aliasrc -O ~/.zsh/aliasrc
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# ohmyzsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## ohmyzsh theme

git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

## ohmyzsh plugins

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

### Tools ###

sudo pacman -S p7zip --noconfirm # archive tools
sudo pacman -S adb fastboot --noconfirm # android tools
sudo pacman -S powertop tlp htop --noconfirm # energy stuff
sudo pacman -S python python-pip python3 --noconfirm # python stuff
sudo pacman -S neofetch figlet cowsay lolcat screen wget curl git tree speedtest-cli rofi --noconfirm # terminal stuff

# yay (aur helper)

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd 

yay -S toilet --answerclean all --noconfirm # terminal stuff from the AUR
yay -S woeusb --answerclean all --noconfirm # woeusb
yay -S nomachine --answerclean all --noconfirm # nomachine
yay -S etcher-git --answerclean all --noconfirm # balena etcher

### Package managers & installers ###

sudo pacman -S flatpak --noconfirm # flatpak

### Communication & Internet ###

sudo pacman -S links --noconfirm # links
sudo pacman -S firefox --noconfirm # firefox
sudo pacman -S discord --noconfirm # discord

yay -S freetube-bin --answerclean all --noconfirm # freetube
yay -S lbry-app-bin --answerclean all --noconfirm # lbry
yay -S haguichi-git --answerclean all --noconfirm # haguichi-git
yay -S logmein-hamachi --answerclean all --noconfirm # logmein-hamachi

# telegram desktop

tgver=2.0.1

mkdir $HOME/Downloads/Telegram
cd $HOME/Downloads/Telegram
wget https://github.com/telegramdesktop/tdesktop/releases/download/v${tgver}/tsetup.${tgver}.tar.xz
tar -xJvf tsetup.${tgver}.tar.xz
sudo mv Telegram /opt/telegram
sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram
cd $HOME

### Gaming ###

sudo pacman -S wine --noconfirm # wine
sudo pacman -S steam --noconfirm # steam
sudo pacman -S lutris --noconfirm # lutris
sudo pacman -S winetricks --noconfirm # winetricks

### Games ###

yay -S minecraft-launcher --answerclean all --noconfirm # minecraft

### Multimedia & documents ###

sudo pacman -S vlc --noconfirm # vlc
sudo pacman -S gimp --noconfirm # gimp
sudo pacman -S mupdf --noconfirm # mupdf
sudo pacman -S kdenlive --noconfirm # kdenlive
sudo pacman -S obs-studio --noconfirm # obs

yay -S spotify --answerclean all --noconfirm # spotify 
yay -S viper4linux-git --answerclean all --noconfirm # viper4linux
yay -S viper4linux-gui-git --answerclean all --noconfirm #viper4linux-gui

### Development ###

sudo pacman -S code --noconfirm # VSCode

yay -S sublime-text --answerclean all --noconfirm # sublime text

### Virtualization ###

# virtualbox

sudo pacman -S virtualbox virtualbox-guest-iso virtualbox-host-modules-arch --noconfirm
sudo gpasswd -a $USER vboxusers
sudo modprobe vboxdrv
yay -S virtualbox-ext-oracle --answerclean all --noconfirm
sudo systemctl enable vboxweb.service
sudo systemctl start vboxweb.service

# vmware workstation

mkdir $HOME/Downloads/vmware
cd $HOME/Downloads/vmware

sudo pacman -S git fuse2 gtkmm linux-headers libcanberra pcsclite --noconfirm
yay -S vmware-systemd-services ncurses5-compat-libs --answerclean all --noconfirm
sudo systemctl start vmware
sudo systemctl enable vmware
wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-15.5.2-15785246.x86_64.bundle
chmod +x VMware-Workstation-Full-15.5.2-15785246.x86_64.bundle
sudo mkdir /etc/init.d
sudo ./VMware-Workstation-Full-15.5.2-15785246.x86_64.bundle
sudo vmware-modconfig --console --install-all
sudo /etc/init.d/vmware start
sudo systemctl start vmware
sudo systemctl enable vmware

sudo pacman -S qemu virt-manager --noconfirm # virt-manager 

### peripheral software ###

yay -s rivalcfg-git --answerclean all --noconfirm # rivalcfg
yay -s ckb-next-git --answerclean all --noconfirm # ckb-next

### hardware tools ###

yay -S gwe --answerclean all --noconfirm # green with envy

### Fonts ###

sudo pacman -S ttf-opensans --noconfirm # needed for telegram desktop
sudo pacman -S adobe-source-han-sans-jp-fonts --noconfirm # japanese fonts
sudo pacman -S adobe-source-han-sans-kr-fonts --noconfirm # korean fonts
sudo pacman -S adobe-source-han-sans-cn-fonts --noconfirm # chinese fonts
sudo pacman -S adobe-source-han-sans-tw-fonts --noconfirm # taiwanese fonts

yay -S ttf-ms-fonts --answerclean all --noconfirm # microsoft fonts, some characters don't show up correctly if not installed
yay -S ttf-meslo-nerd-font-powerlevel10k --answerclean all --noconfirm # patched font for powerlevel10k
