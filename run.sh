#!/bin/sh           
hexo server -d &
sed -i "s/imyouradmin/$PASSWD/g" /blog/node_modules/hexo-editor/_config.yml
cd /blog/node_modules/hexo-editor
npm start
