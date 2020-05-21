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
    rm -rf /home/nodejs

    tar -xvf /home/nodejs.tar.xz -C /home/

    mv "/home/node-$ver-linux-x64" /home/nodejs

    rm /usr/local/bin/node /usr/local/bin/npm

    ln -s /home/nodejs/bin/node /usr/local/bin/

    ln -s /home/nodejs/bin/npm /usr/local/bin/

    rm /home/installNodejs.html /home/nodejs.tar*

    echo ""
    echo ""
    echo "nodejs install success"
    echo "nodejs path: /home/nodejs"
    node=$(node -v)
    npm=$(npm -v)
    echo "node --version:  $node  npm --version: $npm"
fi
