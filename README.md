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
└── web.Dockerfile
```
#### 构建镜像
```text
cd ./web
docker build -t web:1.0 -f web.Dockerfile .

```
#### 运行容器
```text
docker run --name web -d -p 80:80 -v $PWD/code:/var/www/html -v $PWD/nginx-conf:/etc/nginx/conf.d -v $PWD/logs/php:/var/log/php -v $PWD/logs/nginx:/var/log/nginx web:1.0
```