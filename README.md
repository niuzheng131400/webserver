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