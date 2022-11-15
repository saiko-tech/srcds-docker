FROM debian:11

RUN echo steam steam/question select "I AGREE" | debconf-set-selections \
    && echo steam steam/license note '' | debconf-set-selections \
    && dpkg --add-architecture i386 \
    && apt-get update -y \
    && apt-get install -y software-properties-common apt-utils \
    && apt-add-repository non-free \
    && apt-get update -y \
    && apt-get install -y \
    wget \
    gcc-multilib \
    lib32z1 \
    locales \
    unzip \
    net-tools \
    expect \
    steamcmd \
    && ln -s /usr/games/steamcmd /usr/bin/steamcmd \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m steam

USER steam

RUN steamcmd +quit \
    && mkdir -p /home/steam/.steam/sdk32 \
    && mkdir -p /home/steam/.steam/sdk64 \
    && ln -s /home/steam/.local/share/Steam/steamcmd/linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so \
    && ln -s /home/steam/.local/share/Steam/steamcmd/linux64/steamclient.so /home/steam/.steam/sdk64/steamclient.so

ENTRYPOINT ["steamcmd"]

CMD ["+help", "+quit"]
