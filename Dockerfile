FROM alpine:latest
MAINTAINER Huex <huexpub@gmail.com>
RUN  echo "http://mirrors.aliyun.com/alpine/edge/main/" > /etc/apk/repositories \
    && echo "http://mirrors.aliyun.com/alpine/edge/community/" >> /etc/apk/repositories \
    && apk add --update \
        avahi-dev \
        musl-dev \
        libc-dev \
        build-base \
        g++ \
        bash \
        npm \
        git \
        ca-certificates \
        supervisor \
        nodejs \
        nodejs-dev \
        zeromq-dev \
        tzdata \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
RUN npm install --unsafe-perm -g hexo 
RUN hexo init /blog 
RUN cd /blog && npm install hexo-deployer-shell hexo-deployer-git hexo-generator-sitemap hexo-generator-searchdb --save
RUN cd /blog/node_modules \
    && git clone https://github.com/huexpub/hexo-editor.git \
    && cd hexo-editor \
    && npm install --production 

RUN cd /blog \
    &&git clone https://github.com/theme-next/hexo-theme-next themes/next

RUN sed -i "s/imyouradmin/passwd/g" /blog/node_modules/hexo-editor/_config.yml  
COPY run.sh /blog/run.sh
WORKDIR /blog
EXPOSE 4000 2048

CMD ["run.sh"] 