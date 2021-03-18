FROM alpine:3.13.2

RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.10/main" >> /etc/apk/repositories

RUN apk update && \
    apk upgrade && \
    apk add alpine-sdk alpine-conf apk-tools sudo git bash atools vim linux-headers libcap-dev alpine-make-rootfs && \
    apk add \
        zlib-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        freetype-dev \
        fontconfig-dev \
        perl-dev \
        ghostscript-dev \
        libtool \
        tiff-dev \
        lcms2-dev \
        libwebp-dev \
        libxml2-dev \
        libx11-dev \
        libxext-dev \
        chrpath \
        libheif-dev \
        openjpeg \
        librsvg-dev \
        freetype \
        fontconfig \
        ghostscript \
        ghostscript-fonts \
        lcms2 \
        graphviz \
        libzip \
        zstd-dev \
        djvulibre \
        jbig2dec \
        xz-dev \
        openexr \
        pango \
        libraw \
        zip \
        p7zip \
        potrace \
        openjpeg-dev \
        pkgconfig \
        openjpeg-tools \
        jasper-dev

RUN mkdir -p /var/cache/distfiles && \
    chgrp abuild /var/cache/distfiles && \
    chmod a+w /var/cache/distfiles

ADD ./volumes /volumedata
ADD ./abuild /home/dev/.abuild

RUN adduser dev --disabled-password && addgroup dev abuild && addgroup root abuild
RUN echo "dev    ALL=(ALL:ALL)NOPASSWD:ALL" > /etc/sudoers.d/dev

RUN chown -R dev:abuild  /volumedata /home/dev/.abuild

USER dev:abuild

RUN cd /volumedata && \
    abuild && \
    tar -czvf /home/dev/imagemagick.tar.gz -C /home/dev/packages .

ENTRYPOINT [ "watch", "-n", "1", "ls", "-l", "/home/dev/packages/x86_64/" ]