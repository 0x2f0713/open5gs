FROM ubuntu:18.04
RUN mkdir open5gs
COPY . ./open5gs
RUN ls -la ./open5gs
WORKDIR /open5gs
RUN sed -i -e 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//http:\/\/vn\.archive\.ubuntu\.com\/ubuntu/' /etc/apt/sources.list && \
    sed -i -e 's/http:\/\/security\.ubuntu\.com\/ubuntu\//http:\/\/vn\.archive\.ubuntu\.com\/ubuntu/' /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y \
    python3-pip ccache python3-setuptools python3-wheel ninja-build build-essential flex bison git libsctp-dev libgnutls28-dev libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev libnghttp2-dev libmicrohttpd-dev libcurl4-gnutls-dev libnghttp2-dev libtins-dev libtalloc-dev meson
RUN meson build --prefix=`pwd`/install && \
    ninja -C build
WORKDIR /open5gs/build
RUN ninja install && \
    ./run.sh