#！/bin/bash

cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo > /etc/apt/sources.list
echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse' >> /etc/apt/sources.list
echo '' >> /etc/apt/sources.list
echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse' >> /etc/apt/sources.list
echo '' >> /etc/apt/sources.list
echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list
echo '' >> /etc/apt/sources.list
echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list
echo '' >> /etc/apt/sources.list
echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list
echo '' >> /etc/apt/sources.list
echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list
echo '' >> /etc/apt/sources.list
echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list
echo '' >> /etc/apt/sources.list
echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list
echo '' >> /etc/apt/sources.list
echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse' >> /etc/apt/sources.list
echo '' >> /etc/apt/sources.list
echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse' >> /etc/apt/sources.list

apt update

echo y | apt upgrade
