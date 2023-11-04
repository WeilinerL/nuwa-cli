#!/bin/bash

# 停止docker服务
systemctl stop docker

# 查询所有已安装的Docker相关软件包
docker_packages=$(rpm -qa | grep docker)

if [ -z "$docker_packages" ]; then
  echo "未找到任何与Docker相关的软件包。"
  exit 0
fi

# 删除所有镜像
docker rmi $(docker images -q)

# 删除所有容器
docker rm -f $(docker ps -a -q)

# 提示用户确认卸载
echo "以下Docker相关软件包将被卸载："
echo "$docker_packages"

read -p "是否继续卸载这些软件包？ (y/n): " choice

if [ "$choice" != "y" ]; then
  echo "取消卸载操作。"
  exit 0
fi

# 使用yum remove卸载Docker相关软件包
yum remove -y $docker_packages

# 删除Docker数据目录
echo "删除Docker数据目录..."
rm -rf /var/lib/docker

echo "Docker卸载和数据清理完成。"



