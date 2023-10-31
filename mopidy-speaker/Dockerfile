from debian:bullseye

# update system
RUN apt update && apt upgrade -y

# install audiopackages for HA
RUN apt install -y libasound-plugins dumb-init

# add mopidy repo
RUN mkdir -p /etc/apt/keyrings
RUN wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg https://apt.mopidy.com/mopidy.gpg
RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/bullseye.list
RUN apt update && apt upgrade -y

# install mopidy
RUN apt install mopidy mopidy-mpd gstreamer1.0-plugins-bad python3-pip

# install jellyfin extensions
RUN pip3 install mopidy-jellyfin mopidy-musicbox-webclient


# configure
COPY ./jellyfin.ini .
RUN cat ./jellyfin.ini >> /etc/mopidy/mopidy.conf

# enable service
RUN systemctl enable --now mopidy

# entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN usermod -G audio,sudo mopidy && chown mopidy:audio -R $HOME /entrypoin.sh && chmod go+rwx -R $HOME /entrypoint.sh

USER mopidy
EXPOSE 6600 6680 5555/udp
ENTRYPOINT ["usr/bin/dumb-init", "/entrypoint.sh"]
CMD ["/usr/bin/mopidy"]

