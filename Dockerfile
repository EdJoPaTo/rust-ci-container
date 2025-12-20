FROM docker.io/library/rust:1-bullseye AS deb
ENV CARGO_INCREMENTAL=0
RUN cargo install --root=/usr/local/ cargo-deb


FROM docker.io/library/rust:1-bullseye AS final
ENV CARGO_INCREMENTAL=0
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y tar xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=deb /usr/local/bin/cargo-deb /usr/local/bin
