FROM debian:11

RUN dpkg --add-architecture i386 \
    && apt-get update -y \
    && apt-get install -y \
    wget \
    gcc-multilib \
    lib32z1 \
    locales \
    unzip \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m steam

USER steam

RUN mkdir /home/steam/Steam

WORKDIR /home/steam/Steam

RUN wget -qO- https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar zxf - \
    && /home/steam/Steam/steamcmd.sh +quit \
    && mkdir -p /home/steam/.steam/sdk32 \
    && ln -s /home/steam/Steam/linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so

ENTRYPOINT ["/home/steam/Steam/steamcmd.sh"]
