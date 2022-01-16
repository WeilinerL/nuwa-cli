#!/bin/bash

sudo chmod +x ./install.sh 
sudo chmod +x ./local-registry.sh

# 安装docker
./install.sh \
  # 安装启动本地镜像仓库
  && ./local-registry.sh \
  # 构建基础镜像
  && docker build -t 127.0.0.1:5000/nuwa-base:latest -f Dockerfile.base . \
  # 推到本地仓库
  && docker push 127.0.0.1:5000/nuwa-base:latest \
  # 构建项目镜像
  && docker build -t 127.0.0.1:5000/nuwa:latest . \
  # 启动项目
  # 将镜像仓库（容器）的5951端口映射到服务器的5951端口
  && docker run -d -p 5951:5951 127.0.0.1:5000/nuwa:latest








