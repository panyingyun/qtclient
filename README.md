# qtclient
### 1、Docker Run QT UI Demo 

在宿主机上运行命令

```bash
$ xhost +
```

此时就可以使用docker的图形界面了，比如测试如下：

```bash
$ sudo docker run -it -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix lorahz/qtclient:0.2
```



2、 How to build and Run within local machine

```bash
$ xhost +
$ sudo docker build -t qtclient:v0.1 .
$ sudo docker run -it -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix qtclient:v0.1
```

3、More

https://www.michaelapp.com/posts/2021/2021-06-02-Docker%E8%BF%90%E8%A1%8CGUI-%E5%BA%94%E7%94%A8/