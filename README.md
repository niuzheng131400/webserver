#### 结构简介
```text
├── code
│   └── index.php
├── conf
│   └── nginx.conf
├── docker-compose.yml
├── install
│   └── install-php-extensions
├── logs
└── README.md
```
#### 构建镜像
```text
cd ./web
docker build -t web:1.0 -f web.Dockerfile .

```
#### 运行容器
```text
docker run --name web -d -p 80:80 -v $PWD/code:/var/www/html -v $PWD/conf:/etc/nginx/conf.d -v $PWD/logs/php:/var/log/php -v $PWD/logs/nginx:/var/log/nginx web:1.0
```
