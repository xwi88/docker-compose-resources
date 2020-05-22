# docker-compose-resources

>docker-compose file sets for dev

docker-compose.yml 文件中引用的环境变量，它们的优先级如下：

- Compose file
- Shell environment variables(每次执行前source，可区分环境测试)
- Environment file
- Dockerfile
- Variable is not defined

## Docker Engine Install

>建议版本:

- Docker Desktop Version: **2.3.1.0**, Channel: **edge**
- Engine: 19.03.8+
- Compose: 1.26.0-rc4+

- [Install on CentOS](https://docs.docker.com/engine/install/centos/)
- [Install binaries](https://docs.docker.com/engine/install/binaries/)
  - [linux](https://download.docker.com/linux/static/stable/x86_64/)
  - [mac](https://download.docker.com/mac/static/stable/x86_64/)

### Binaries Install

```bash
sudo cp docker/* /usr/bin/
```
