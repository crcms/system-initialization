#!/bin/bash

# apt update
sudo apt-get update

############## vim #######################
sudo apt-get install vim

############# git ######################
sudo apt-get intall git

############# deepin-wine-ubuntu ######################
git clone https://gitee.com/wszqkzqk/deepin-wine-for-ubuntu.git ~/deepin-wine-for-ubuntu
sudo bash ~/deepin-wine-for-ubuntu/install.sh
# qq
wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.im/deepin.com.qq.im_8.9.19983deepin23_i386.deb -O qq.deb
sudo dpkg -i qq.deb
# 徾信
http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.wechat/deepin.com.wechat_2.6.2.31deepin0_i386.deb -O weichat.deb
sudo dpkg -i weichat.deb
# 百度网盘
http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.baidu.pan/deepin.com.baidu.pan_5.7.3deepin0_i386.deb -O pan.deb
sudo dpkg -i pan.deb
# 徾信
http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.thunderspeed/deepin.com.thunderspeed_7.10.35.366deepin18_i386.deb -O xunlei.deb
sudo dpkg -i xunlei.deb

############# 输入法 ######################
# 搜索拼音
wget http://cdn2.ime.sogou.com/dl/index/1524572264/sogoupinyin_2.2.0.0108_amd64.deb?st=X7oHrcyiKc9UivRgyAN9SA&e=1553615383&fn=sogoupinyin_2.2.0.0108_amd64.deb -O suogoupingyin.deb
sudo dpkg -i suogoupingyin.deb
sudo apt-get install -f
sudo dpkg -i suogoupingyin.deb
# 五笔
sudo apt-get install fcitx-table-wubi

############# shadowsocks ######################
shadowsocks_path=/opt/shadowsocks
sudo cp -r ./tools/shadowsocks /opt
sudo chmod +x ${shadowsocks_path}/Shadowsocks-Qt5-3.0.1-x86_64.AppImage
# genpac
# todo 有问题pip应该是不存在的，需要先安装pip
sudo pip install -U genpac
genpac --proxy="SOCKS5 127.0.0.1:1080" --gfwlist-proxy="SOCKS5 127.0.0.1:1080" -o autoproxy.pac --gfwlist-url="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"
