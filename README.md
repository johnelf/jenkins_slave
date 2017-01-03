# 基于之前的master的jenins slave node

使用jnlp的Java Web Start方式启动，为了更安全，在sshd_config中disable root permission，只开放指定端口

```bash
docker run -it -e "MASTER_URL=<your_master_url/IP>" -e "MASTER_PORT=<jenkins_service_port>" -e "SLAVE_NAME=<your_slave_name>" slave
```

- MASTER_URL就是jenkins的服务器的hostname或者IP address
- MASTER_PORT是jenkins的服务端口
- SLAVE_NAME是刚才在jenkins里配置的名字
