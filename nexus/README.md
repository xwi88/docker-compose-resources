# [Nexus](https://github.com/sonatype/docker-nexus3)

## 安装

### 环境参考

- MAC OS: Mojave 10.14.3
- Docker Desktop Version: **2.3.1.0**, Channel: **edge**
- Engine: 19.03.8
- Compose: 1.26.0-rc4

#### docker-compose

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version

# sudo rm /usr/local/bin/docker-compose
```

### 启动

`docker-compose up`

密码见: `./nexus-data/admin.password`, 格式如: `37f441ab-ffbf-42d4-a955-3f0686187c23`

我们改为: admin123

### 端口分配

- `8081:8081` **WEB UI**
- `9091:9091` **Docker hub group(pull only)**
- `9092:9092` ***docker hosted(private)***

## Docker

### Docker Hub Proxy

```bash
Name: docker-hub-proxy
Repository Connectors:
    Allow anonymous docker pull: checked
Proxy:
    Remote storage: https://registry-1.docker.io
    Docker Index: Use Docker Hub
Storage:
    Blob Store: docker-hub-proxy
```

### Third Hub Proxy

>remote storage list

|Name|Remote storage|配置|Blob|Desc|
|:---|:---|:---|:---|:---|
|docker-hub-ustc|https://docker.mirrors.ustc.edu.cn|Y|docker-hub-proxy|中国科学技术大学|
|docker-hub-cn|https://registry.docker-cn.com|Y|docker-hub-proxy|docker 中国|
|docker-hub-qiniu|https://reg-mirror.qiniu.com|N|docker-hub-proxy|七牛云|
|docker-hub-azure|https://dockerhub.azk8s.cn|N|docker-hub-proxy|Azure|

```bash
Name: docker-hub-ustc
Repository Connectors:
    Allow anonymous docker pull: checked
Proxy:
    Remote storage: https://docker.mirrors.ustc.edu.cn
    Docker Index: Use proxy registry(specified above)
Storage:
    Blob Store: docker-hub-proxy
Hosted:
    Deployment policy: Read Only
```

### Docker Hub Hosted

> Private docker hub, shall support pull & push

```bash
Name: docker-hub-private
Repository Connectors
    HTTP: 9092
    Allow anonymous docker pull: checked
#Repository Connectors.HTTPs:
Storage:
    Blob Store: docker-hub-private
Hosted:
    Deployment policy: Allow redeploy
```

### Docker Hub Group

> docker hub with hosted & group

```bash
Name: docker-hub-group
Repository Connectors
    HTTP: 9091
    Allow anonymous docker pull: checked
#Repository Connectors.HTTPs:
Storage:
    Blob Store: docker-hub-group
```

## 配置修改

>创建或修改 `/etc/docker/daemon.json` 或 `~/.docker/daemon.json`

```json
{
    "debug": true,
    "experimental": false,
    "insecure-registries": ["127.0.0.1:9091","127.0.0.1:9092"],
    "registry-mirrors": [
        "http://127.0.0.1:9091",
        "http://127.0.0.1:9092",
        "https://mirror.ccs.tencentyun.com",
        "https://registry.docker-cn.com",
        "https://docker.mirrors.ustc.edu.cn",
        "https://reg-mirror.qiniu.com",
        "https://dockerhub.azk8s.cn"
    ]
}
```

## Go

>present not support hosted

### Go Proxy

>remote storage list

|Name|Remote storage|配置|Blob|Desc|
|:---|:---|:---|:---|:---|
|go-proxy-aliyun|https://mirrors.aliyun.com/goproxy|Y|go-proxy|阿里云|
|go-proxy-cn|https://goproxy.cn|Y|go-proxy|七牛云|
|go-proxy-io|https://goproxy.io|Y|go-proxy|全球|
|go-proxy-gocenter|https://gocenter.io|Y|go-proxy||
|go-proxy-golang|https://proxy.golang.org|Y|go-proxy||
|go-proxy-athens|https://athens.azurefd.net|Y|athens||

```bash
Name: go-proxy-aliyun
Proxy:
    Remote storage: https://mirrors.aliyun.com/goproxy
    Maximum component age: -1
Storage:
    Blob Store: go-proxy
```

### Go Group

```bash
Name: go-proxy-group
Storage:
    Blob Store: go-group
```

### Usage

```bash
# login 9091:read only, 9092:read & write
docker login 127.0.0.1:9091 -u admin -p admin123

docker login 127.0.0.1:9091
docker login 127.0.0.1:9092

#镜像查看
docker images

#拉取镜像到本地(nexus不存在则会缓存)
docker pull 127.0.0.1:9091/redis

docker pull 127.0.0.1:9092/nexus
docker pull 127.0.0.1:9092/kafka


# 推送镜像 9092
docker tag xxxx 127.0.0.1:9092/xxxx:version
docker push 127.0.0.1:9092/xxxx:version
```
