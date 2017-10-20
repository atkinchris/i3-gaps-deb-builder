FROM ruby:stretch

RUN gem install --no-ri --no-rdoc fpm

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -yqq update && apt-get -yqq --no-install-recommends install \
    build-essential \
    devscripts \
    asciidoc \
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
    xcb \
    xmlto \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
ADD . .

CMD ["sh", "./build.sh"]
