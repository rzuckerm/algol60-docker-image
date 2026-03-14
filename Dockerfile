FROM alpine:3.23.3

COPY ALGOL60_* *.patch /tmp/
RUN VERSION=$(cat /tmp/ALGOL60_VERSION) && \
    apk add --no-cache make wget gzip gcc musl-dev && \
    cd /tmp && \
    wget https://ftp.gnu.org/gnu/marst/${VERSION}.tar.gz && \
    tar xzf  ${VERSION}.tar.gz && \
    rm -f ${VERSION}.tar.gz && \
    cd ${VERSION}/ && \
    ./configure && \
    make && \
    make install && \
    cd / && \
    rm -rf ${VERSION}/ && \
    apk del make wget gzip
