#!/bin/bash

# 下载并启动本地镜像仓库
# /root/docker/registry为默认的用户镜像仓库安装地址
# 将镜像仓库（容器）的5000端口映射到服务器的5000端口
docker run -d -p 5000:5000 -v /root/docker/registry:/var/lib/registry registry