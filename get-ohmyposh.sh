#!/bin/sh
sudo wget -v https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

mkdir ~/.poshthemes
wget -v https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
sudo apt install unzip -y
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

#sudo chown $USER: /usr/local/bin/oh-my-posh
sudo chmod 755 /usr/local/bin/oh-my-posh

oh-my-posh font install

echo 'eval "$(oh-my-posh init bash)"' | tee -a ~/.profile
echo export TERM=xterm-256color | tee -a ~/.profile
exec bash
. ~/.profile


