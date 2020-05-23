ver=""
if [ x$1 != x ] ;then
	ver=$1
else
	wget http://nodejs.cn/download/ -O /home/installNodejs.html
	ver=$(cat /home/installNodejs.html | grep 'v[0-9]*\.[0-9]*\.[0-9]*' -o | awk NR==1)
fi

url="https://npm.taobao.org/mirrors/node/$ver/node-$ver-linux-x64.tar.xz"

wget $url -O /home/nodejs.tar.xz

recordfile=/home/nodejs.tar.xz

if [ ! -f "$recordfile" ] ;then
	echo "download nodejs fail, please check your network or check nodejs version"
else
    echo "remove old version of nodejs"
    rm -rf /home/nodejs

    echo "unzip nodejs package"    
    tar -xf /home/nodejs.tar.xz -C /home/

    mv "/home/node-$ver-linux-x64" /home/nodejs

# 配置nodejs命令的环境变量, 全局命令的系统环境变量
    echo "set nodejs system environment variables"
    echo "export PATH=$PATH:/home/nodejs:/home/node_modules" > /etc/profile.d/nodejs.sh
    echo "export NODE_PATH=/home/node_modules/lib/node_modules" >> /etc/profile.d/nodejs.sh

    chmod 755 /etc/profile.d/nodejs.sh

    source /etc/profile

# 配置npm全局命令路径
    echo "set npm package global path"
    npm config set prefix "/home/node_modules"
# 配置npm包缓存路径
    echo "set npm package cache path"
    npm config set cache "/home/npm_cache"

# 删除下载的文件
    echo "remove cache install file"
    rm /home/installNodejs.html /home/nodejs.tar*

# 打印输出
    echo ""
    echo ""
    echo "nodejs install success"
    echo ""
    echo "nodejs path:         /home/nodejs"
    echo "npm global path:     /home/node_modules"
    echo "npm cache path:      /home/npm_cache"
    node=$(node -v)
    npm=$(npm -v)
    echo ""
    echo "node --version:  $node  npm --version: $npm"
    echo ""
    echo "please exit and log in again if you are using it for the first time"
fi

