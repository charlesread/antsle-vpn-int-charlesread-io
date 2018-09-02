#!/bin/sh

docker build . -t ipsec-vpn-server

docker run \
    --name ipsec-vpn-server \
    --env-file src/vpn.env \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d \
    --privileged \
    ipsec-vpn-server