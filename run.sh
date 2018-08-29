#!/bin/sh           
hexo server -d &
cd /blog/node_modules/hexo-editor
npm start
