#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/sbin
export PATH


function v2ray(){
    echo "###       你的专用后端对接       ###"
    echo "###           By D             ###"
    echo "###    Update: 2020-03-17      ###"

    echo " "
    echo -e "\033[41;33m 本功能仅支持Debian 9，请勿在其他系统中运行 \033[0m"
    echo " "
    echo "---------------------------------------------------------------------------"
    echo " "

    echo " "
    echo -e "\033[42;37m 请输入对接域名 \033[0m 参考格式 http://sspanel.com有https就写https"
    read host
    echo " "

    echo " "
    echo -e "\033[42;37m 请输入muKey \033[0m 参考格式 sspanel"
    read muKey
    echo " "

    echo " "
    echo -e "\033[42;37m 请输入节点ID \033[0m 参考格式 42"
    read nodeid
    echo " "

    echo " "
    echo "---------------------------------------------------------------------------"
    echo -e "\033[41;33m 请确认下列信息无误，任何失误需要重置操作系统！\033[0m"
    echo -e "\033[42;37m 对接域名 \033[0m $host"
    echo -e "\033[42;37m muKey \033[0m $muKey"
    echo -e "\033[42;37m 节点ID \033[0m $nodeid"
    echo " "
    echo -e "\033[41;33m 回车以继续，ctrl+C退出 \033[0m"
    echo " "
    echo "---------------------------------------------------------------------------"

    read -n 1
    echo '1.1.1.1 www.baidu.com' >>/etc/hosts
    apt-get update -y
    apt-get install curl -y
    bash <(curl -L -s  https://raw.githubusercontent.com/dongfangmu/v2ray-sspanel-v3-mod_Uim-plugin/master/install-release.sh) \
    --panelurl $host --panelkey 8 --nodeid $nodeid \
    --downwithpanel 1 --speedtestrate 6 --paneltype 0 --usemysql 0
    systemctl start v2ray.service
    echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
    echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
    sysctl -p
    echo " "
    echo " "
    echo -e "\033[42;37m 安装完成 \033[0m"
}


function menu(){
    echo "###       你的专用后端对接       ###"
    echo "###           By D             ###"
    echo "###    Update: 2020-03-17      ###"
    echo ""

    echo "---------------------------------------------------------------------------"

    echo -e "\033[42;37m [1] \033[0m 安装v2ray后端"
    echo -e "\033[41;33m 请输入选项以继续， \033[0m"

    opt=0
    read opt
    if [ "$opt"x = "1"x ]; then
        v2ray

    else
        v2ray
        
    fi
}

menu
