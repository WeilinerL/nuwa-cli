# nuwa-cli

project initialization、CD framework

项目初始化、持续部署框架

# 开发指南
1. yarn install
2. yarn install:sub
3. npx husky install
4. yarn run dev

# 发布
```
yarn release
```

# 安装指南
1. 登录你的CentOS
2. 去[Github](https://github.com/WeilinerL/nuwa-cli/releases)选择最新的release版本，拷贝下载地址进行下载，如：(**注意：这里的`0.0.1-demo`与下面启动项目中的名称一致**)
```
curl -Lo nuwa-cli.tar.gz https://github.com/WeilinerL/nuwa-cli/archive/refs/tags/0.0.1-demo.tar.gz
```
3. 解压下载的安装包
```
tar -zxvf nuwa-cli.tar.gz
```
4. 启动项目
```
chmod +x ./nuwa-cli-0.0.1-demo/bin/docker/start.sh
cd ./nuwa-cli-0.0.1-demo/bin/docker
./start.sh
```