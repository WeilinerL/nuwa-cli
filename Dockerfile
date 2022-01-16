FROM 127.0.0.1:5000/nuwa-base:latest

WORKDIR /nuwa

# 基于基础镜像安装 node 16 和 yarn 并构建项目
RUN source ~/.bashrc \ 
  && nvm install 16 \
  && npm install -g yarn
  && yarn install \
  && yarn prepublish \
  && yarn install --production

# 拷贝文件
COPY bin/nuwa-cli /nuwa/bin/nuwa-cli
COPY bin/start.sh /nuwa/bin/start.sh
COPY node_modules /nuwa/node_modules
COPY dist* /nuwa/dist
COPY package.json /nuwa/package.json

# 添加容器启动脚本
# !important 注意与/bin/docker/start.sh 中的第19行中启动脚本位置一致
RUN chmod +x /nuwa/bin/start.sh
CMD ["/nuwa/bin/start.sh"]