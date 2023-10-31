#build system
FROM ubuntu:latest as builder

# install deps and update system
RUN apt update && apt upgrade -y
RUN apt install -y golang libasound2-dev git

# get repository
WORKDIR /jellycli
RUN git clone https://github.com/somik861/jellycli.git .

# bootstrap
COPY ./build_bootstrap.sh .
RUN ./build_bootstrap.sh

# build
RUN go build . && ./jellycli --help

# runtime
FROM ubuntu:latest
RUN apt update && apt upgrade -y
RUN apt install -y libasound2 dbus-x11 dbus libasound2-plugins
RUN mkdir -p /root/.config/jellycli
COPY ./run.sh /
COPY --from=builder /jellycli/jellycli /usr/local/bin/

ENTRYPOINT [ "/run.sh" ]
