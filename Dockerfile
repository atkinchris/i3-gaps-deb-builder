FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -yqq update && apt-get -yqq install \
    asciidoc \
    devscripts \
    dh-autoreconf \
    docbook-xml \
    dpkg-dev \
    git \
    libev-dev \
    libpango1.0-dev \
    libstartup-notification0-dev \
    libxcb-cursor-dev \
    libxcb-icccm4-dev \
    libxcb-keysyms1-dev \
    libxcb-randr0-dev \
    libxcb-util0-dev \
    libxcb-xinerama0-dev \
    libxcb-xkb-dev \
    libxcb-xrm-dev \
    libxcb-xrm0 \
    libxcb1-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    libyajl-dev \
    nano \
    xcb \
    xmlto \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/i3
RUN git clone https://www.github.com/Airblader/i3 . && \
    autoreconf --force --install && \
    rm -rf build && \
    mkdir -p build && cd build && \
    ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers

ENV DEBEMAIL="atkinchris@gmail.com"
ENV DEBFULLNAME="Chris Atkin"
RUN dpkg-buildpackage -us -uc

WORKDIR /tmp/i3/build
