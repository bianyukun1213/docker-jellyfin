#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0); pwd)
chmod +x $CURRENT_DIR/scripts/run.sh
sudo podman build -t docker.io/heyhollis/jellyfin:$1 .
sudo podman run -d --privileged --network="bridge" -p 8096:8096 -v $CURRENT_DIR/test_config:/config docker.io/heyhollis/jellyfin:$1

