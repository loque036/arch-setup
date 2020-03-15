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

sudo pacman -S --noconfirm p7zip # archive tools
sudo pacman -S --noconfirm adb fastboot # android tools
sudo pacman -S --noconfirm powertop tlp htop # energy stuff
sudo pacman -S --noconfirm python python-pip python3 # python stuff
sudo pacman -S --noconfirm neofetch figlet cowsay lolcat screen wget curl git tree speedtest-cli rofi # terminal stuff

# yay (aur helper)

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd 

yay -S toilet --answerclean all --noconfirm # terminal stuff from the AUR
yay -S woeusb --answerclean all --noconfirm # woeusb
yay -S nomachine --answerclean all --noconfirm # nomachine
yay -S balena-etcher --answerclean all --noconfirm # balena etcher

### Package managers & installers ###

sudo pacman -S --noconfirm flatpak # flatpak

### Communication & Internet ###

sudo pacman -S --noconfirm links # links
sudo pacman -S --noconfirm firefox # firefox
sudo pacman -S --noconfirm telegram-desktop # telegram desktop

yay -S discord-ptb --answerclean all --noconfirm # discord-ptb
yay -S lbry-app-bin --answerclean all --noconfirm # lbry
yay -S haguichi-git --answerclean all --noconfirm # haguichi-git
yay -S logmein-hamachi --answerclean all --noconfirm # logmein-hamachi

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

yay -S spotify --answerclean all --noconfirm # spotify 
yay -S sublime-text --answerclean all --noconfirm # sublime text
yay -S obs-studio-git --answerclean all --noconfirm # obs
yay -S viper4linux-git --answerclean all --noconfirm # viper4linux
yay -S viper4linux-gui-git --answerclean all --noconfirm #viper4linux-gui

### Virtualization ###

sudo pacman -S --noconfirm virtualbox # virtualbox
sudo pacman -S --noconfirm virt-manager # virt-manager 
sudo pacman -S --noconfirm virtualbox-host-modules # something virtualbox needs kek

yay -S vmware-workstation --answerclean all --noconfirm # vmware-workstation

### peripheral software ###

yay -s rivalcfg-git --answerclean all --noconfirm # rivalcfg
yay -s ckb-next-git --answerclean all --noconfirm # ckb-next

### hardware tools ###

yay -S gwe --answerclean all --noconfirm # green with envy

### --- Remove KDE stuff i don't need --- ### 

# KDE Development

sudo pacman -R lokalize kimagemapeditor akonadiconsole cervisia cuttlefish kapptemplate kcachegrind kdevelop kuiviewer kirigami2gallery kompare plasmaengineexplorer lookandfeelexplorer assistant designer linguist qdbusviewer umbrello UserFeedbackConsole --noconfirm

# KDE Education

sudo pacman -R artikulate klettres kwordquiz kiten parley cantor kalgebra kbruch kig kmplot rocs kgeography ktouch kturtle minuet step marble kalzium --noconfirm

# KDE Games 

sudo pacman -R knetwalk killbots klickety klines konquest ksirkskineditor ksirk knavalbattle klickety --noconfirm
sudo pacman -R bomber granatier kblocks kbounce kbreakout kgoldrunner ksnakeduel kspaceduel kolf kollision kapman --noconfirm
sudo pacman -R bovo kblackbox kfourinline kmahjongg kreversi ksquares kajongg kigo kiriki knights kshisen kpatience lskat --noconfirm
sudo pacman -R blinken khangman kanagram ktuberling kdiamond ksudoku kubrick palapeli picmikatomic kjumpingcube kjumpingcube --noconfirm

# KDE Graphics

sudo pacman -R kolourpaint okular kcolorchooser kruler --noconfirm

# KDE Internet

sudo pacman -R akregator kmail kget konqueror kopete krfb --noconfirm

# KDE Multimedia

sudo pacman -R dragon elisa juk k3b kmix kamoso kwave --noconfirm

# KDE Office

sudo pacman -R kaddressbook korganizer kontact --noconfirm

# KDE System

sudo pacman -R discover yakuake --noconfirm

# KDE Utils

sudo pacman -R kate kwrite kteatime knotes --noconfirm

### End ###

exit
