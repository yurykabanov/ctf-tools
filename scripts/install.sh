#!/bin/bash

set -e

echo ">>> apt update <<<"
apt update && apt upgrade

# Unminimize installation
echo ">>> unminimize <<<"
yes | unminimize

# Configure timezone and locales
apt install -y tzdata locales

ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime
echo "Etc/UTC" > /etc/timezone
dpkg-reconfigure --frontend=noninteractive tzdata

sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
echo LANG="en_US.UTF-8" > /etc/default/locale
dpkg-reconfigure --frontend=noninteractive locales
update-locale LANG=en_US.UTF-8

# Install packages
echo ">>> apt install <<<"
apt install -y \
	man-db wget curl less \
	build-essential cmake gcc gdb libssl-dev libffi-dev build-essential \
	fish tree mc git neovim atool ripgrep exa \
	htop iotop nmon \
	screen tmux \
	iproute2 whois dnsutils net-tools apache2-utils mtr-tiny netcat \
	inetutils-ftp inetutils-ping inetutils-traceroute \
	jq \
	python python3 python3-pip \
	php8.0 php8.0-cli php8.0-curl php8.0-gd php8.0-mbstring php8.0-readline php8.0-xml \
	nmap hydra binwalk

# Install golang
echo ">>> install golang <<<"
wget "https://golang.org/dl/go1.17.3.linux-amd64.tar.gz" -O /tmp/go.tar.gz
aunpack /tmp/go.tar.gz -X /usr/local/
rm -rf /tmp/go.tar.gz
PATH=/usr/local/go/bin:$PATH

echo ">>> chsh <<<"
chsh -s /usr/bin/fish

echo ">>> install nvim plugins <<<"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qall

echo ">>> install tools <<<"

echo ">>> install recon: gobuster <<<"
go install github.com/OJ/gobuster/v3@latest

echo ">>> install recon: amass <<<"
go get github.com/OWASP/Amass/v3/...

echo ">>> install exploitation: metasploit <<<"
## TODO: official installation script has broken signing keys
# curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /tmp/msfinstall && \
# chmod 755 /tmp/msfinstall && \
# /tmp/msfinstall
wget "https://apt.metasploit.com/pool/main/m/metasploit-framework/metasploit-framework_6.1.16%2B20211120112544~1rapid7-1_amd64.deb" -O /tmp/metasploit.deb
dpkg -i /tmp/metasploit.deb
rm -rf /tmp/metasploit.deb

echo ">>> install exploitation: sqlmap <<<"
wget "https://github.com/sqlmapproject/sqlmap/zipball/master" -O /tmp/sqlmap.zip
aunpack /tmp/sqlmap.zip -X /tmp/sqlmap
mv /tmp/sqlmap/sqlmapproject-sqlmap-* /opt/sqlmap
ln -s /opt/sqlmap/sqlmap.py  /usr/local/bin/sqlmap
rm -rf /tmp/sqlmap.zip /tmp/sqlmap

echo ">>> install exploitation: getsploit <<<"
pip install getsploit

echo ">>> install exploitation: searchsploit <<<"
git clone --depth=1 https://github.com/offensive-security/exploitdb.git /opt/exploitdb
ln -s /opt/exploitdb/searchsploit /usr/local/bin/searchsploit

echo ">>> install exploitation: pwntools <<<"
pip install pwntools

echo ">>> install privesc: PEASS <<<"
wget "https://github.com/carlospolop/PEASS-ng/archive/refs/heads/master.zip" -O /tmp/peas.zip
aunpack /tmp/peas.zip -X /tmp/peas
mv /tmp/peas/PEASS-ng-master /opt/peass
rm -rf /tmp/peas

