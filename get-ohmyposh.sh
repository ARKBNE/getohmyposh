#!/bin/bash
sudo apt install wget -y

#amd64 or arm64
platform=`dpkg --print-architecture`

sudo wget -v https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-${platform} -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
sudo chmod 755 /usr/local/bin/oh-my-posh

mkdir ~/.poshthemes
wget -v https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
sudo apt install unzip -y
#-o overwirte no promot
unzip -o ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

/usr/local/bin/oh-my-posh font install

#TODO test if path is include, for example using `which oh-my-posh`

#echo 'export TERM=xterm-256color' | tee -a ~/.bashrc
grep -xF "export TERM=xterm-256color" ~/.bashrc || echo "export TERM=xterm-256color" | tee -a ~/.bashrc

#echo 'eval "$(oh-my-posh init bash)"' | tee -a ~/.bashrc
grep -xF 'eval "$(oh-my-posh init bash)"' ~/.bashrc || echo 'eval "$(oh-my-posh init bash)"' | tee -a ~/.bashrc

exec bash
