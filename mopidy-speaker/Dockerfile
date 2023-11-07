FROM debian:bullseye

# update system
RUN apt update && apt upgrade -y

# install audiopackages for HA
RUN apt install -y libasound2-plugins wget git

# add mopidy repo
RUN mkdir -p /etc/apt/keyrings
RUN wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg https://apt.mopidy.com/mopidy.gpg
RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/bullseye.list
RUN apt update && apt upgrade -y

# install mopidy
RUN apt install -y mopidy mopidy-mpd gstreamer1.0-plugins-bad python3-pip

# install jellyfin extensions
RUN pip3 install mopidy-jellyfin 
RUN pip3 install mopidy-musicbox-webclient

# get program control
RUN git clone https://github.com/somik861/program-control.git
RUN pip3 install -r program-control/requirements.txt

# configure
COPY ./jellyfin.ini .
COPY ./program_control.yaml .
RUN mkdir -p ~/.config/mopidy && cat ./jellyfin.ini >> ~/.config/mopidy/mopidy.conf

EXPOSE 6600
EXPOSE 6680
CMD mopidy config && python3 program-control/program_control.py program_control.yaml mopidy && sleep 300
