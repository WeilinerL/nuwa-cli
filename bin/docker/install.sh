#!/bin/bash

echo "开始下载docker..."

# 使用国内 daocloud 一键安装命令
curl -sSL https://get.daocloud.io/docker | sh \
  && echo "安装完成" \
  # 启动docker
  && systemctl start docker