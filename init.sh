#!/bin/bash

# apt update
sudo apt-get update

############## vim #######################
sudo apt-get install -y vim

############# zip ######################
sudo apt-get install -y unzip

############# git ######################
sudo apt-get install -y git

############# gitkraken ######################
wget https://release.axocdn.com/linux/gitkraken-amd64.deb -O gitkraken.deb
sudo dpkg -i gitkraken.deb


############# mac skin ######################
sudo apt-get update
sudo apt-get install -y gnome-tweak-tool gnome-shell-extensions gnome-shell-extension-dashtodock gnome-shell-extension-top-icons-plus chrome-gnome-shell
wget https://dl.opendesktop.org/api/files/download/id/1523902544/s/ede5bc5c844b290e6e136ca68ae22cb2b72575769e1e9e6488acbfb3979c31b92fe01e8403fafe485a6c4c6f1b4a2fd1cd81806b455d6ffb613aac886ab9755d/t/1553693498/u//X-Arc-Collection-v1.4.9.zip -O X-Arc-Collection.zip
unzip X-Arc-Collection.zip
# cp /usr/share/themes
wget https://github.com/keeferrourke/la-capitaine-icon-theme/archive/v0.6.1.tar.gz -O la-capitaine-icon.tra.gz
tar zxvf la-capitaine-icon.tra.gz ./
# cp /usr/share/icons
# 使用tweak载入shell主题 => tweak -- 外观 -- shell -- 选择Sierra shell主题
# 使用tweak载入icon主题 => tweak -- 外观 -- 图标 -- 选择对应的图标主题
# Ubuntu18.04 使用[Dash to dock]插件时同时出现两个dock的问题
# 解决方法是去tweak设置里关闭[Dash to dock]的开关，别担心，关闭后，[Dash to dock]仍然正常工作，但是再也不会同时出现两个dock栏的尴尬情况了。
# TopIcons
#wget https://extensions.gnome.org/extension-data/TopIcons%40phocean.net.v22.shell-extension.zip -O TopIcons.zip
#unzip TopIcons.zip
#sudo apt-get install make && sudo make install


############# chrome ######################
sudo dpkg -i ./tools/google-chrome-stable_current_amd64.deb


############# deepin-wine-ubuntu ######################
git clone https://gitee.com/wszqkzqk/deepin-wine-for-ubuntu.git ~/deepin-wine-for-ubuntu
sudo bash ~/deepin-wine-for-ubuntu/install.sh
# qq
wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.im/deepin.com.qq.im_8.9.19983deepin23_i386.deb -O qq.deb
sudo dpkg -i qq.deb
# 徾信
wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.wechat/deepin.com.wechat_2.6.2.31deepin0_i386.deb -O weichat.deb
sudo dpkg -i weichat.deb
# 百度网盘
wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.baidu.pan/deepin.com.baidu.pan_5.7.3deepin0_i386.deb -O pan.deb
sudo dpkg -i pan.deb
# 徾信
wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.thunderspeed/deepin.com.thunderspeed_7.10.35.366deepin18_i386.deb -O xunlei.deb
sudo dpkg -i xunlei.deb

# deepin-terminal
sudo apt-get install zssh
sudo apt-get install deepin-terminal

############# 输入法 ######################
# 搜索拼音
wget http://cdn2.ime.sogou.com/dl/index/1524572264/sogoupinyin_2.2.0.0108_amd64.deb -O suogoupingyin.deb
sudo dpkg -i suogoupingyin.deb
sudo apt-get install -f
sudo dpkg -i suogoupingyin.deb
# 五笔
sudo apt-get install fcitx-table-wubi


############# oh my zsh ######################
sudo apt-get install -y curl zsh
zsh --version
chsh -s $(which zsh)
echo $SHELL
cd ~
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
source ~/.zshrc
#plugins=(zsh-autosuggestions)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


############# docker ######################
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://0vkjge55.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
# without sudo
sudo usermod -aG docker $USER
# docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

############# laradock ######################
mkdir ~/env
git clone https://github.com/laradock/laradock.git ~/env/laradock


############# phpstorm ######################
wget https://download.jetbrains.8686c.com/webide/PhpStorm-2018.3.5.tar.gz -O PhpStorm.tar.gz
sudo tar xfz PhpStorm.tar.gz -C /opt/
sudo chmod +x Php*/bin/phpstorm.sh


############# goland ######################
wget https://download.jetbrains.8686c.com/go/goland-2018.3.5.tar.gz -O goland.tar.gz
sudo tar xfz goland.tar.gz -C /opt/
sudo chmod +x Go*/bin/goland.sh


############# shadowsocks ######################
shadowsocks_path=/opt/shadowsocks
sudo cp -r ./tools/shadowsocks /opt
sudo chmod +x ${shadowsocks_path}/Shadowsocks-Qt5-3.0.1-x86_64.AppImage
sudo cp ${shadowsocks_path}/shadowsocks.desktop /usr/share/applications
sudo apt-get install -y python-pip
sudo pip install -U genpac
genpac --proxy="SOCKS5 127.0.0.1:1080" --gfwlist-proxy="SOCKS5 127.0.0.1:1080" -o autoproxy.pac --gfwlist-url="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"


