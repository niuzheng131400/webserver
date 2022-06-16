### 概述
#### 阿里云的国内源加速
#### 安装了一些工具
- cron、curl、inetutils-ping、telnet、git、zlib1g-dev、nginx、supervisor、libzip-dev、unzip、procps、sudo、vim
#### 安装了一些常用的PHP扩展
- composer、gd、xdebug、zip、pdo_mysql、opcache、mysqli、bcmath、redis、mongodb、swoole
#### 安装了supervisor守护进程,保证进程安全运行
#### 结构简介
```text
├── code
│   └── index.php
├── docker-compose.yml
├── init-database
│   └── init.sql
├── install
│   └── install-php-extensions
├── logs
│   ├── nginx
│   └── php
├── mysql-data
├── mysqlroot.txt
├── nginx-conf
│   └── nginx.conf
├── README.md
├── redis-conf
│   └── redis.conf
└── web.Dockerfile
```
#### 构建镜像 && 运行容器
```text
docker-compose up -d  --build

```
#### 注意构建运行遇到这个问题的话 [output clipped, log limit 1MiB reached]
```text
# ubuntu 修改日志内存限制
vim  /etc/systemd/system/multi-user.target.wants/docker.service 

# 添加以下信息 
[Service]
Environment="BUILDKIT_STEP_LOG_MAX_SIZE=1073741824"
Environment="BUILDKIT_STEP_LOG_MAX_SPEED=10240000"

# 重启
systemctl daemon-reload
systemctl restart docker.service
```
#### 运行 
```text
http://192.168.56.2:80/
```
