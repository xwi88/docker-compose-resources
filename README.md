# docker-compose-resources

>docker-compose file sets for dev

docker-compose.yml 文件中引用的环境变量，它们的优先级如下：

- Compose file
- Shell environment variables(每次执行前source，可区分环境测试)
- Environment file
- Dockerfile
- Variable is not defined
