#!/bin/bash

# Updates
sudo apt-get -y -qq update
#sudo apt-get -y remove grub-pc
sudo apt-mark hold grub-pc
#sudo apt-get -y install grub-pc
#sudo grub-install /dev/sda
#sudo update-grub # fix https://github.com/hashicorp/vagrant/issues/289
sudo apt-get -y -qq upgrade

sudo apt-get -y install python2.7-dev # header files
sudo apt-get -y install texinfo
sudo apt-get -y install screen
sudo apt-get -y install git
sudo apt-get -y install build-essential
sudo apt-get -y install unzip
sudo apt-get -y install htop
sudo apt-get -y install libncurses-dev

# Install AVR toolchain
sudo apt-get -y install freeglut3-dev
sudo apt-get -y install gcc-avr binutils-avr avr-libc

# Compile avr-gdb with python support
mkdir tools
pushd tools
sudo apt-get -y install libelf-dev
wget http://ftp.gnu.org/gnu/gdb/gdb-8.0.tar.gz
tar -xzf gdb-8.0.tar.gz
pushd gdb-8.0
./configure --prefix=/usr --with-python --target=avr
sudo make
sudo make install
popd
rm -rf gdb-8.0.tar.gz
# Install AVRdude
sudo apt-get -y install avrdude

# simavr
sudo apt-get -y install pkg-config
git clone https://github.com/buserror/simavr.git
pushd simavr
sudo make
popd

# radare2
git clone https://github.com/radare/radare2.git
pushd radare2
./sys/install.sh
popd

# oh-my-zsh
sudo apt-get -y install zsh
echo vagrant | sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# tmux
wget https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz
tar -zxvf tmux-2.5.tar.gz
pushd tmux-2.5
sudo apt-get -y install libevent-dev
sudo apt-get -y install libncurses-dev
./configure && make && sudo make install
popd
rm -rf tmux-2.5.tar.gz
rm -rf tmux-2.5

#picocom
sudo apt-get -y install picocom

# avarice
sudo apt-get -y install avarice
