#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Raspbian
#

set -ax

MYHOME=`getent passwd ${SUDO_UID:-$(id -u)} | cut -d: -f 6`
REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"
SRC="$MYHOME/dotfiles"
OS=""

mkdir -p ~/ffmpeg_sources -p ~/bin
cd ~/ffmpeg_sources

do_install_ffmpeg(){
    echo "ffmpeg"
}


build_ffmpeg(){
    echo ".."
    cd ~/ffmpeg_sources && \
    wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
    tar xjvf ffmpeg-snapshot.tar.bz2 && \
    cd ffmpeg && \
    PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
      --prefix="$HOME/ffmpeg_build" \
      --pkg-config-flags="--static" \
      --extra-cflags="-I$HOME/ffmpeg_build/include" \
      --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
      --extra-libs="-lpthread -lm" \
      --bindir="$HOME/bin" \
      --enable-gpl \
      --enable-libaom \
      --enable-libass \
      --enable-libfdk-aac \
      --enable-libfreetype \
      --enable-libmp3lame \
      --enable-libopus \
      --enable-libvorbis \
      --enable-libvpx \
      --enable-libx264 \
      --enable-libx265 \
      --enable-nonfree && \
    PATH="$HOME/bin:$PATH" make && \
    make install && \
    hash -r && \
    echo "[ OK ]"
}

build_NASM(){
    echo "Buildin[NASM] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    wget https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03.tar.bz2 && \
    tar xjvf nasm-2.13.03.tar.bz2 && \
    cd nasm-2.13.03 && \
    ./autogen.sh && \
    PATH="$HOME/bin:$PATH" ./configure --prefix="/opt/ffmpeg_build" --bindir="$HOME/bin" && \
    make && \
    make install && \
    echo "[ OK ]"
}
build_YASM(){
    sudo apt-get install -y yasm
    return 0

    # Check if the version of yasm >= 1.2.0
    # ....

    # If not, then manually build
    echo "Buildin[YASM] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    wget -O yasm-1.3.0.tar.gz https://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz && \
    tar xzvf yasm-1.3.0.tar.gz && \
    cd yasm-1.3.0 && \
    ./configure --prefix="/opt/ffmpeg_build" --bindir="$HOME/bin" && \
    make && \
    make install && \
    echo "[ OK ]"
}
build_libx264(){
    sudo apt-get install -y libx264-dev
    return 0

    # Check if the version of yasm >= 118
    # ....

    # If not, then manually build
    echo "Building [libx264] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    git -C x264 pull 2> /dev/null || git clone --depth 1 https://git.videolan.org/git/x264 && \
    cd x264 && \
    PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static --enable-pic && \
    PATH="$HOME/bin:$PATH" make && \
    make install && \
    echo "[ OK ]"
}
build_libx265(){
    # Raspbian repository doesn't has any of these
    #sudo apt-get install -y libx265-dev 
    #sudo apt-get install -y libnuma-dev
    #return 0

    # Check if the version of yasm >= 68
    # ....

    # If not, then manually build
    echo "Building [libx265] for ffmpeg..."
    sudo apt-get install -y mercurial && \
    sudo apt-get install -y libnuma-dev && \
    cd ~/ffmpeg_sources && \
    if cd x265 2> /dev/null; then hg pull && hg update; else hg clone https://bitbucket.org/multicoreware/x265; fi && \
    cd x265/build/linux && \
    PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED=off ../../source && \
    PATH="$HOME/bin:$PATH" make && \
    make install && \
    echo "[ OK ]"
}
build_libvpx(){
    # Raspbian's repos only has libvpx up to 1.3
    #sudo apt-get install -y libvpx-dev
    #return 0

    # Check if the version of yasm >= 1.4.0
    # ....

    # If not, then manually build
    echo "Building [libvpx] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    git -C libvpx pull 2> /dev/null || git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git && \
    cd libvpx && \
    PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm && \
    PATH="$HOME/bin:$PATH" make && \
    make install && \
    echo "[ OK ]"
}
build_libfdk-aac(){
    sudo apt-get install -y libfdk-aac-dev
    return 0

    # Check if it's installed
    # ....

    # If not, then manually build
    echo "Building [libfdk] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
    cd fdk-aac && \
    autoreconf -fiv && \
    ./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
    make && \
    make install && \
    echo "[ OK ]"
}
build_libmp3lame(){
    sudo apt-get install -y libmp3lame-dev
    return 0

    # Check if the version of yasm >= 3.98.3
    # ....

    # If not, then manually build
    echo "Building [libmp3lame] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    wget -O lame-3.100.tar.gz https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz && \
    tar xzvf lame-3.100.tar.gz && \
    cd lame-3.100 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm && \
    PATH="$HOME/bin:$PATH" make && \
    make install && \
    echo "[ OK ]"
}
build_libopus(){
    sudo apt-get install -y libopus-dev
    return 0

    # Check if the version of yasm >= 1.1
    # ....

    # If not, then manually build
    echo "Building [libopus] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    git -C opus pull 2> /dev/null || git clone --depth 1 https://github.com/xiph/opus.git && \
    cd opus && \
    ./autogen.sh && \
    ./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
    make && \
    make install && \
    echo "[ OK ]"
}
build_libaom(){
    return 0
    # Check if the version of yasm >= 1.2.0
    # ....
    # If not, then manually build
    echo "Building [libaom] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    git -C aom pull 2> /dev/null || git clone --depth 1 https://aomedia.googlesource.com/aom && \
    mkdir aom_build && \
    cd aom_build && \
    PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED=off -DENABLE_NASM=on ../aom && \
    PATH="$HOME/bin:$PATH" make && \
    make install && \
    echo "[ OK ]"
}






