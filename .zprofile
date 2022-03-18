function proxy_on() {
    export http_proxy=http://127.0.0.1:7890
    export https_proxy=$http_proxy
    export ALL_PROXY=socks5:///127.0.0.1:7890
    echo -e "终端代理已开启。"
}

function proxy_off(){
    unset http_proxy https_proxy
    echo -e "终端代理已关闭。"
}

function git_proxy_on()
{
	git config --global https.proxy https://127.0.0.1:7890
	git config --global http.proxy http://127.0.0.1:7890
	echo -e "git代理已开启。"
}

function git_proxy_off()
{
	git config --global --unset http.proxy
	git config --global --unset https.proxy
	echo -e "git代理已关闭。"
}
