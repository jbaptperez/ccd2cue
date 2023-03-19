FROM debian:latest AS builder

RUN apt-get update && apt-get install -y \
    automake \
    autoconf \
    gettext \
    help2man \
    autopoint \
    texinfo \
    gcc \
    make \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://git.savannah.gnu.org/git/ccd2cue.git \
    && cd ccd2cue \
    && sed -E -i 's/\^makeinfo/^texi2any/' configure.ac \
    && ./bootstrap \
    && ./configure \
    && make \
    && make install

FROM "debian:latest"

COPY --from=builder /usr/local/bin/ccd2cue /usr/local/bin/

ENTRYPOINT [ "ccd2cue" ]
