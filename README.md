##  [博客文章地址](https://niuzheng.net/archives/3114/)


### 概述
#### 阿里云的国内源加速
#### 安装了一些工具
- cron、curl、inetutils-ping、telnet、git、zlib1g-dev、nginx、supervisor、libzip-dev、unzip、procps、sudo、vim
#### 安装了一些常用的PHP扩展
- composer、gd、xdebug、zip、pdo_mysql、opcache、mysqli、bcmath、redis、mongodb、swoole(swoole 有一些问题)
#### 安装了supervisor守护进程,保证进程安全运行
#### 支持自动更新ssl
#### 结构简介

```text
├── docker-compose.yml
├── Dockerfile
├── logs
│      ├── mysql
│      ├── nginx
│      ├── php
│      └── supervisor
├── mysql
│      ├── conf
│      ├── init
│      └── mysqlroot.txt
├── nginx
│      ├── nginx-443.conf
│      ├── nginx-443.conf.default
│      └── nginx-80.conf
├── php
│      └── php.ini
├── php-fpm
│      └── www.conf
├── project
│      ├── test
│      └── ssl
├── redis
│      └── redis.conf
└── supervisor
    └── web.conf
```

- logs        mysql日志、nginx日志、php日志、supervisor日志
- mysql       conf配置文件、init初始化导入数据库以及数据表、mysqlroot.txt为root密码
- nginx       nginx配置文件
- php         php配置文件
- php-fpm     php-fpm配置文件
- redis       redis配置文件
- supervisor  supervisor守护进程配置文件



#### 使用

```shell
git clone https://github.com/niuzheng131400/webserver.git
cd webserver
```

#### 设置端口以及防火墙以及安全组等
```shell
# 查看当前开放的端口
firewall-cmd --zone=public --list-ports

# 开放80端口(http)
firewall-cmd --zone=public --add-port=80/tcp --permanent

# 开放443端口(ssl)
firewall-cmd --zone=public --add-port=443/tcp --permanent

# 开放8080端口(adminer)
firewall-cmd --zone=public --add-port=8080/tcp --permanent

# 更新防火墙规则
firewall-cmd --reload

# 移除8081端口等
firewall-cmd --zone=public --remove-port=8081/tcp --permanent

```

#### 配置SSL申请参数 (我这里使用的是阿里云)
- 如果不是阿里云的请参考官方文档调整对应的参数 [acme.sh官方文档](https://github.com/acmesh-official/acme.sh/wiki/说明)
- docker-composer.yml  -> Ali_Key 以及 Ali_Secret

#### 构建镜像 && 运行容器

```shell
docker-compose up -d
```

#### 测试访问http(略)

#### 申请SSL && 自动更新证书
```shell
# 测试是否安装成功
docker-compose exec acme.sh sh -c 'acme.sh -v'

# 变量是否导入成功
docker-compose exec acme.sh sh -c 'echo $Ali_Key'

# 开始申请
docker-compose exec acme.sh sh -c 'acme.sh  --register-account  -m 邮箱 --server zerossl'
docker-compose exec acme.sh sh -c 'acme.sh --issue -d 域名 --dns  dns_ali --debug'
docker-compose exec acme.sh sh -c 'acme.sh --install-cert -d 域名 --key-file  /acme.sh/ssl/key.pem  --fullchain-file /acme.sh/ssl/cert.pem'

# 宿主机定时任务
0 0 * * * docker-compose exec acme.sh --cron
```

#### 测试访问https(略)
