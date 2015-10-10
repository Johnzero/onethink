#!/usr/bin/env python
import os
from livereload import Server, shell

server = Server()
server.watch((os.getcwd()+'\\application'))
server.watch((os.getcwd()+'\\public'))
server.watch((os.getcwd()+'\\ThinkPHP'))

server.serve(port=8080,host='192.168.6.80')
