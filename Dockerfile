FROM alpine:3.18.12

COPY ALGOL60_* *.patch /tmp/
RUN apk add --no-cache make wget unzip patch gcc musl-dev && \
    cd /tmp && \
    wget https://www.algol60.org/translators/algol-60-compiler.zip && \
    unzip algol-60-compiler.zip && \
    rm -f algol-60-compiler.zip && \
    cd algol-60-compiler && \
    patch -p0 < /tmp/runtime.c.patch && \
    rm -f /tmp/runtime.c.patch && \
    ./configure && \
    make && \
    make install && \
    cd / && \
    rm -rf algol-60-compiler && \
    apk del make wget unzip patch
