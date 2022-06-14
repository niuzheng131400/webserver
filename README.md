#### 结构简介
```text
├── code
│   └── index.php
├── conf
│   └── nginx.conf
├── install
│   └── install-php-extensions
├── logs
│   ├── nginx
│   │   ├── access.log
│   │   ├── error.log
│   │   ├── www.test.com_access.log
│   │   └── www.test.com_error.log
│   └── php
│       └── php_errors.log
├── REAMME.md
└── web.Dockerfile
```
#### 构建镜像
```text
cd ./web
docker build -t web:1.0 -f web.Dockerfile .

```
#### 运行容器
```text
docker run --name web -d -p 80:80 -v $PWD/code:/var/www/html -v $PWD/conf:/etc/nginx/conf.d -v $PWD/logs:/var/log web:1.0
```
