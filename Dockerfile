FROM localhost:5000/nuwa-base:latest

WORKDIR /nuwa

# 拷贝文件
COPY nginx.conf /usr/local/nginx/conf/nginx.conf
COPY bin/start.sh /nuwa/bin/start.sh
COPY packages/workbench /nuwa/workbench

# 基于基础镜像安装 node 16 和 yarn 并构建项目
RUN source ~/.bashrc \
  && nvm install 16 \
  && npm install -g yarn

# 添加容器启动脚本
# !important 注意与/bin/docker/start.sh 中的第19行中启动脚本位置一致
RUN chmod +x /nuwa/bin/start.sh
CMD ["/nuwa/bin/start.sh"]