#! /usr/bin/env bash
#
# Enviroment: Raspbian
#

set -x

# Read environment variables
if [ ! -e /tmp/env-os -a -e /tmp/env-user ]; then
    echo "Please run './configure' before installment."
    exit 1;
else
    export MYOS=`cat /tmp/env-os`
    export USER=`cat /tmp/env-user`
fi

mkdir -p ~/ffmpeg_sources -p ~/bin
cd ~/ffmpeg_sources

do_install_ffmpeg(){
    if [ $# -eq 0 ]; then 
        echo "[ Failed ] Please specify OS version with --os flag."
        return 1; 
    fi
    # Get distro information
    distro=""
    while [ $# -gt 0 ] ;do
        case "$1" in
            "--os")
                distro=$2 
                shift 2;;
        esac
    done
    # Do different things with different OS
    case $distro in
        "ubuntu")
            echo "ubuntu"
            ;;
        "raspbian")
            build_NASM_pi
            build_YASM_pi
            build_libx264_pi
            build_libmp3lame_pi
            build_libopus_pi
            build_libvpx_pi
            build_libfdk_aac_pi
            # build_libx265_pi
            # build_libaom_pi
            build_ffmpeg_pi
            ;;
    esac
}


build_ffmpeg_pi(){
    cd ~/ffmpeg_sources && \
    wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
    tar xjvf ffmpeg-snapshot.tar.bz2 && \
    cd ffmpeg && \
    PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="/opt/ffmpeg_build/lib/pkgconfig" ./configure \
      --prefix="/opt/ffmpeg_build" \
      --pkg-config-flags="--static" \
      --extra-cflags="-I/opt/ffmpeg_build/include" \
      --extra-ldflags="-L/opt/ffmpeg_build/lib" \
      --extra-libs="-lpthread -lm" \
      --bindir="$HOME/bin" \
      --enable-gpl \
      --enable-libass \
      --enable-libfdk-aac \
      --enable-libfreetype \
      --enable-libmp3lame \
      --enable-libopus \
      --enable-libvorbis \
      --enable-libvpx \
      --enable-libx264 \
      --enable-nonfree && \
    PATH="$HOME/bin:$PATH" make && \
    sudo make install && \
    hash -r && \
    echo "[ OK. ]"
}

build_NASM_pi(){
    echo "Buildin[NASM] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    wget https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03.tar.bz2 && \
    tar xjvf nasm-2.13.03.tar.bz2 && \
    cd nasm-2.13.03 && \
    ./autogen.sh && \
    PATH="$HOME/bin:$PATH" ./configure --prefix="/opt/ffmpeg_build" --bindir="$HOME/bin" && \
    make && \
    sudo make install && \
    echo "[ OK. ]"
}
build_YASM_pi(){
    sudo apt-get install -y yasm && echo "[ OK. ]"

    # Check if the version of yasm >= 1.2.0
    # ....
    return 0

    # If not, then manually build
    echo "Buildin[YASM] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    wget -O yasm-1.3.0.tar.gz https://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz && \
    tar xzvf yasm-1.3.0.tar.gz && \
    cd yasm-1.3.0 && \
    ./configure --prefix="/opt/ffmpeg_build" --bindir="$HOME/bin" && \
    make && \
    sudo make install && \
    echo "[ OK ]"
}
build_libx264_pi(){
    #sudo apt-get install -y libx264-dev && echo "[ Doesn't work well. ]"
    # Check if the version of yasm >= 118
    # ....
    #return 0

    # If not, then manually build
    echo "Building [libx264] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    git -C x264 pull 2> /dev/null || git clone --depth 1 https://git.videolan.org/git/x264 && \
    cd x264 && \
    PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="/opt/ffmpeg_build/lib/pkgconfig" \
        ./configure --prefix="/opt/ffmpeg_build" \
        --bindir="$HOME/bin" --enable-static --enable-pic && \
    PATH="$HOME/bin:$PATH" make && \
    sudo make install && \
    echo "[ OK. ]"
}
build_libmp3lame_pi(){
    sudo apt-get install -y libmp3lame-dev && echo "[ OK. ]"

    # Check if the version of yasm >= 3.98.3
    # ....
    return 0

    # If not, then manually build
    echo "Building [libmp3lame] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    wget -O lame-3.100.tar.gz https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz && \
    tar xzvf lame-3.100.tar.gz && \
    cd lame-3.100 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix="/opt/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm && \
    PATH="$HOME/bin:$PATH" make && \
    sudo make install && \
    echo "[ OK ]"
}
build_libopus_pi(){
    sudo apt-get install -y libopus-dev && echo "[ OK. ]"

    # Check if the version of yasm >= 1.1
    # ....
    return 0

    # If not, then manually build
    echo "Building [libopus] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    git -C opus pull 2> /dev/null || git clone --depth 1 https://github.com/xiph/opus.git && \
    cd opus && \
    ./autogen.sh && \
    ./configure --prefix="/opt/ffmpeg_build" --disable-shared && \
    make && \
    sudo make install && \
    echo "[ OK ]"
}
build_libvpx_pi(){
    # Raspbian's repos only has libvpx up to 1.3
    #sudo apt-get install -y libvpx-dev && echo "[ FAILED ]"

    # Check if the version of yasm >= 1.4.0
    # ....
    #return 0

    # If not, then manually build
    #
    # Proxy required for access of Google
    echo "Building [libvpx] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    git -C libvpx pull 2> /dev/null || git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git && \
    cd libvpx && \
    PATH="$HOME/bin:$PATH" ./configure --prefix="/opt/ffmpeg_build" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm && \
    PATH="$HOME/bin:$PATH" make && \
    sudo make install && \
    echo "[ OK. ]"
}
build_libfdk_aac_pi(){
    #sudo apt-get install -y libfdk-aac-dev && echo "[ FAILED ]" 

    # Check if it's installed
    # ....
    #return 0

    # If not, then manually build
    echo "Building [libfdk] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
    cd fdk-aac && \
    autoreconf -fiv && \
    ./configure --prefix="/opt/ffmpeg_build" --disable-shared && \
    make && \
    sudo make install && \
    echo "[ OK. ]"
}


build_libaom_pi(){
    # This will fail on pi
    #
    # Proxy required for access of Google
    echo "Building [libaom] for ffmpeg..."
    cd ~/ffmpeg_sources && \
    git -C aom pull 2> /dev/null || git clone --depth 1 https://aomedia.googlesource.com/aom && \
    mkdir aom_build && \
    cd aom_build && \
    PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg_build" -DENABLE_SHARED=off -DENABLE_NASM=on ../aom && \
    PATH="$HOME/bin:$PATH" make && echo "[FAILED]" && \
    sudo make install && \
    echo "[ FAILED ]"
}
build_libx265_pi(){
    # Actually this will fail.
    # So give up on x265 on pi, it's too advanced to have 265 on pi
    #
    # Refer to reddit post:
    # https://www.reddit.com/r/raspberry_pi/comments/89o5m4/pi_3_kodi_x265/

    # Refer to Official x265 repo for full instruction
    # https://bitbucket.org/multicoreware/x265/wiki/Home
    echo "Building [libx265] for ffmpeg..."

    sudo apt-get install -y mercurial cmake cmake-curses-gui build-essential gcc-arm-linux-gnueabi g++-arm-linux-gnueabi && \
    cd ~/ffmpeg_sources && \
    if cd x265 2> /dev/null; then 
        hg pull && hg update; 
    else 
        # Somehow can't clone this murcury repo
        # hg clone https://bitbucket.org/multicoreware/x265
        # or, download manually
        wget https://bitbucket.org/multicoreware/x265/downloads/x265_2.9.tar.gz && \
        tar -xzvf x265_2.9.tar.gz && mv tar -xzvf x265_2.9 x265
    fi && \
    cd x265/build/arm-linux && \
    bash ./make-Makefiles.bash && \
    make && \
    echo "[ FAILED ]"
}








