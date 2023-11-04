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
cd ./nuwa-cli-0.0.1-demo/bin/docker && chmod +x ./start.sh && ./start.sh
```

# milestone
- [x] 完成对CentOS服务器的docker初始化安装
- [x] 服务器本地docker镜像仓库搭建
- [x] 基础镜像制作（nuwa-base）
- [ ] [workben搭建] 代码仓库
- [ ] [workben搭建] 项目配置（git地址、deploy key、web hook、nginx等）
- [ ] [workben搭建] 服务器web hook node服务搭建（触发项目构建，根据dockerfile生成构建产物）
- [ ] [workben搭建] 流水线（部署版本控制，支持回滚，版本以文件夹加时间戳的形式存储，支持在线删除之前的版本）
