#!bin/bash
CURRENT_DIR=$(cd $(dirname $0); pwd)
chmod +x $CURRENT_DIR/scripts/run.sh
sudo docker build -t $1 .
sudo docker run -d --network="bridge" -p 8096:8096 -v /config:$CURRENT_DIR/test_env $1
