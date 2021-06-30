FROM amd64/ubuntu:20.04

COPY ./sources.list /etc/apt/

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y build-essential wget zlib1g-dev vim  gfortran g++ gcc make cmake qt5-default \
    qtcreator libgl1-mesa-dev libx11-dev libxcb-keysyms1-dev libxcb-image0-dev \
    libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync0-dev libxcb-xfixes0-dev \
    libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev \
    libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev \
    libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev x11vnc \
    xauth build-essential mesa-common-dev libglu1-mesa-dev libxkbcommon-dev \
    libxcb-xkb-dev libxslt1-dev libxkbcommon-x11-0 freeglut3-dev

RUN apt install -y language-pack-zh-han* language-pack-gnome-zh-han*
RUN apt install $(check-language-support) -y

ENV QT_DEBUG_PLUGINS=1 
ENV LANG="zh_CN.UTF-8"
ENV LANGUAGE="zh_CN:zh:en_US:en"

WORKDIR /opt/

COPY ./qtclient  .

RUN /bin/sh auto_build_linux.sh 

RUN mv ./build/qtclient /usr/local/bin && /bin/chmod -R 755 /usr/local/bin/qtclient 

CMD ["qtclient"]
