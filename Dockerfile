FROM 127.0.0.1:5000/nuwa-base:latest

WORKDIR /nuwa

# 基于基础镜像安装 node 16
RUN source ~/.bashrc \ 
  && nvm install 16

# 安装依赖与构建
RUN yarn install \
  && yarn prepublish \
  && yarn install --production

# 拷贝文件
COPY bin/nuwa-cli /nuwa/bin/nuwa-cli
COPY node_modules /nuwa/node_modules
COPY dist* /nuwa/dist
COPY package.json /nuwa/package.json

# 执行脚本命令
RUN yarn dev