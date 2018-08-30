# hexo-next-docker

## Dockerfile
run.sh与dockfile同一目录后使用 docker build -t hexo:latest . 创建images

## RUN

确保你映射的目录有hexo.yml和next.yml，文件已经提供，一个是端点配置文件，一个是主题配置文件

```
docker run --network=host -d  \
    --restart=always \
    -v /opt/hexo/source:/blog/source \
    -v /opt/hexo/hexo.yml:/blog/_config.yml \
    -v /opt/hexo/next.yml:/blog/themes/next/_config.yml \
    -e PASSWD="替换成你的编辑器密码"
    --name hexo \
    hexo:latest

```
## WEB
使用 http://ip:2048访问hexo-editor  http://ip:4000访问在线页面


## PUBLIC
默认hexo -g生成的文件在镜像内部/blog/public内，如果需要映射到本地 ，启动时添加以下内容
```
-v /opt/hexo/public:/blog/public \

```
## HELP
http://theme-next.iissnan.com/getting-started.html

