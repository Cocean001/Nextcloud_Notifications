#!/bin/bash
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}

#输入Cloud的Name
green "======================================="
green "              请输入容器名               "
green "======================================="
read Container_Names

#自动获取Container ID
Cloud_ID=`docker ps --format "table {{.ID}}\{{.Names}}" | egrep $Container_Names$ | cut -c 1-12`

#统计行数
UserCount=`docker exec --user www-data $Cloud_ID php occ user:list | grep -c - | cut -c 1-2`

#判别容器是否存在
if [[ $Cloud_ID == "" ]]; then
    red "======================================="
    red "       该容器不存在，请重新输入！        "
    red "======================================="
    exit 0
fi

#输入标题
green "======================================="
green "              请输入公告标题             "
green "======================================="
read header
	
#输入正文
green "======================================="
green "              请输入正文内容             "
green "======================================="
read -r notes

#确认发布内容 
green  "======================================="
green  "              请核对公告内容              "
yellow "    公告标题为：$header                  "
yellow "    公告内容为：$notes                   "
green  "======================================="
green  "            是否确认发布（Y/N)           " 

read choice_pub
if [[ $choice_pub == "y" ]]||[[ $choice_pub == "Y" ]]; then
    for ((i=1; i<=$UserCount; i=i+1))
    do
        CloudUser=`docker exec --user www-data $Cloud_ID php occ user:list | grep - |  cut -d: -f2 | sed -n ''$i','$i'p'`
        docker exec --user www-data $Cloud_ID php occ notification:generate $CloudUser "$header" -l "$notes"
    done
fi
	#输出确认
	blue "======================================="
	blue "        已将新公告发送给指定用户          "
	blue "======================================="	
	
echo "退出程序"
exit 0