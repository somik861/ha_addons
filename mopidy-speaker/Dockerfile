from debian:bullseye

# update system
RUN apt update && apt upgrade -y

# install audiopackages for HA
RUN apt install -y libasound2-plugins wget

# add mopidy repo
RUN mkdir -p /etc/apt/keyrings
RUN wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg https://apt.mopidy.com/mopidy.gpg
RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/bullseye.list
RUN apt update && apt upgrade -y

# install mopidy
RUN apt install -y mopidy mopidy-mpd gstreamer1.0-plugins-bad python3-pip

# install jellyfin extensions
RUN pip3 install mopidy-jellyfin mopidy-musicbox-webclient

# configure
COPY ./jellyfin.ini .
RUN mkdir -p ~/.config/mopidy && cat ./jellyfin.ini >> ~/.config/mopidy/mopidy.conf

EXPOSE 6600
EXPOSE 6680
CMD mopidy config && mopidy
