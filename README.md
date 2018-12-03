# Step by step from scratch

```
passwd
```
```
dhcpcd
systemctl start sshd
```
### SSH Onto system
```
cat "https://www.archlinux.org/mirrorlist/?country=GB&protocol=http&protocol=https&ip_version=4" > /etc/pacman.d/mirrorlist
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist
pacman -Syyy
```
```
fdisk /dev/sda
g
n
1
ENTER
+300M
t
1
n
2
ENTER
ENTER
```
```
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
pacstrap -i /mnt base
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```
### uncomment en_GB.UTF-8
```
pacman -S grub efibootmgr dosfstools openssh os-prober mtools linux-headers linux-lts linux-lts-headers
vi /etc/locale.gen
```
```
locale-gen
systemctl enable sshd
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg (ignore the warning)
```
```
fallocate -l 8G /swapfile
chmod 600 /swapfile
mkswap /swapfile
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
cat /etc/fstab
```
### if using an SSD add `rw,discard,relatime` in the options
```
sed -i 's/^rw,relatime/rw,discard,relatime/g' /etc/fstab
cat /etc/fstab
```
### Allow root ssh for later
```
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
passwd
```
```
systemctl enable sshd
exit
umount -a
reboot
```
```
dhcpcd
```
### ssh back onto the system
```
localectl set-locale LANG="en_GB.UTF-8"
vi /etc/pacman.conf
```
### uncomment
```
#[multilib]
#Include = /etc/pacman.d/mirrorlist/Include
```
```
pacman -Sy networkmanager xorg-server xorg-xinit xorg-apps mesa xf86-video-intel lib32-intel-dri lib32-mesa lib32-libgl sudo vim nm-connection-editor i3-gaps rxvt-unicode rofi lightdm bash-completion feh noto-fonts chromium mpv youtube-dl ranger pulseaudio pavucontrol htop lm_sensors dunst 
```
```
systemctl enable NetworkManager
systemctl start NetworkManager
systemctl enable lightdm
```
### Uncomment %wheel ALL=(ALL) ALL
```
visudo
```
```
useradd -m -G wheel -s /bin/bash pascal
passwd pascal
```
### Disable root ssh
```
sed -i 's/PermitRootLogin yes/#PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
exit
```
### ssh back in
```
echo 'exec i3' > ~/.xinitrc
sudo pacman -S --needed base-devel git wget yajl
```
```
cd /tmp
git clone https://aur.archlinux.org/package-query.git
cd package-query/
makepkg -si && cd /tmp/
```
```
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si
```
```
sudo mkdir /usr/share/fonts/misc
sudo wget https://github.com/supermarin/YosemiteSanFranciscoFont/raw/master/System%20San%20Francisco%20Display%20Regular.ttf -P /usr/share/fonts/misc
fc-cache
```
```
yaourt -S polybar python-pywal ttf-hack bdf-unifont siji-git i3lock-color nerd-fonts-hack nerd-fonts-source-code-pro pulseaudio-dlna flameshot-git arc-grk-theme lxapperarance lightdm-mini-greeter
```
```
git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme && ./autogen.sh --prefix=/usr && sudo make install && cd && rm -rf arc-icon-theme
git clone https://github.com/alexanderjeurissen/ranger_devicons.git /tmp/ranger_devicons && cd /tmp/ranger_devicons && make install && cd && rm -rf /tmp/ranger_devicons
```
```
vim .grkrc-2.0
  gtk-font-name="System San Francisco Display 11"
vim .config/gtk-3.0/settings.ini
  gtk-font-name="System San Francisco Display 11"
```
```
sudo wget https://raw.githubusercontent.com/pascaldulieu/dotfiles/master/fonts.conf -o /etc/fonts/fonts.conf
sensors-detect
```
