#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/#\(zh_CN\.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/#\(zh_CN\.GBK\)/\1/' /etc/locale.gen
sed -i 's/#\(zh_CN\.GB2312\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/PRC /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root

! id user && useradd -m -p "" -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -s /usr/bin/zsh user
#echo -e "passwd\npasswd" | passwd user
passwd user -d

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf
sed -i '80 i user ALL=\(ALL\) ALL' /etc/sudoers

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service

mkdir /etc/skel/.config/mpd
mkdir /etc/skel/.mpd
cp /usr/share/doc/mpd/mpdconf.example /etc/skel/.config/mpd/mpd.conf

sed -i '110 d' /etc/pacman.conf
sed -i '110 d' /etc/pacman.conf
sed -i '110 d' /etc/pacman.conf
# Dirty!!!
