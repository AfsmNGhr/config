FROM kalilinux/kali-linux-docker

RUN apt-get update -qq && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -qqy aircrack-ng wifite reaver tshark \
       usbutils pciutils --no-install-recommends \
    && apt-get clean && rm -rf /tmp/* /var/tmp/* \
       /var/lib/apt/lists/* /var/cache/apt/ /var/log/*
