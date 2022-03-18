#!/bin/bash
echo "配置代理"
cp .zprofile $HOME/.zprofile
source $HOME/.zprofile
proxy_on
git_proxy_on

echo "配置oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
cp .zshrc $HOME/.zshrc
source $HOME/.zshrc


echo "安装docker"
sudo -i 
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh --mirror Aliyun

echo "启动docker"
systemctl enable docker
systemctl start docker

echo "分配docker用户组"
usermod -aG docker $USER

echo "配置docker代理"
mkdir /etc/systemd/system/docker.service.d/
cp proxy.conf /etc/systemd/system/docker.service.d/
systemctl systemctl daemon-reload && systemctl restart docker
exit
