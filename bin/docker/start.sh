#!/bin/bash

sudo chmod +x ./install.sh 
sudo chmod +x ./local-registry.sh

# 1. 安装docker
# 2. 安装启动本地镜像仓库
# 3. 构建基础镜像
# 4. 推到本地仓库
# 5. 构建项目镜像
# 6. 启动项目容器并将镜像仓库（容器）的5951端口映射到服务器的5951端口、80端口映射到6580端口
# 7. 启动项目服务
./install.sh \
  && ./local-registry.sh \
  && docker build -t localhost:5000/nuwa-base:latest -f ../../Dockerfile.base . \
  && docker push localhost:5000/nuwa-base:latest \
  && docker build -t localhost:5000/nuwa:latest -f ../../Dockerfile ../../ \
  && docker run -itd -p 5951:5951 -p 6580:80 --name="nuwa" localhost:5000/nuwa:latest /bin/bash \
  && docker exec -itd nuwa /bin/bash /nuwa/bin/start.sh \
  && echo '项目启动完成！请使用命令 `curl localhost:6580` 测试nginx页面是否工作正常.'
