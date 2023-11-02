#!/bin/bash

echo "开始下载docker..."

# 使用国内 daocloud 一键安装命令
# 启动docker
curl -sSL https://get.docker.com | sh \
  && echo "安装完成" \
  && systemctl start docker