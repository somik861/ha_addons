from debian:bullseye

# install mopidy
RUN apt update && apt upgrade -y
RUN apt install -y python3-pip
RUN mkdir -p /etc/apt/keyrings && wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg https://apt.mopidy.com/mopidy.gpg
RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/bullseye.list
RUN apt update && apt install -y mopidy

# install jellyfin plugin
RUN pip3 install --user mopidy-jellyfin
RUN pip3 install --user mopidy-mpd mopidy-musicbox-webclient

#configure
COPY ./jellyfin.ini .
RUN cat jellyfin.ini >> $HOME/.config/mopidy/mopidy.conf
