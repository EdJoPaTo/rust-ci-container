FROM docker.io/library/rust:1-slim-bullseye AS deb
ENV CARGO_INCREMENTAL=0
RUN cargo install --root=/usr/local/ cargo-deb cargo-hack


FROM docker.io/library/rust:1-slim-bullseye AS final
ENV CARGO_INCREMENTAL=0
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y tar xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN rustup component add clippy
RUN rustup toolchain install nightly --profile=minimal --component=rustfmt

COPY --from=deb /usr/local/bin/* /usr/local/bin
