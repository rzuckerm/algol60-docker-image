FROM alpine:3.18.12

COPY ALGOL60_* /tmp/
RUN apk add --no-cache git make wget unzip gcc musl-dev && \
    cd /tmp && \
    wget https://www.algol60.org/translators/algol-60-compiler.zip && \
    unzip algol-60-compiler.zip && \
    rm -f algol-60-compiler.zip && \
    cd algol-60-compiler && \
    ./configure && \
    make && \
    make install && \
    cd / && \
    rm -rf algol-60-compiler && \
    apk del git make wget unzip
