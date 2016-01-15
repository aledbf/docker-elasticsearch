#!/bin/sh

# provision elasticsearch user
adduser --disabled-password --gecos "" elasticsearch
usermod -a -G sudo elasticsearch
chown -R elasticsearch /elasticsearch /data

# set environment
export CLUSTER_NAME=${CLUSTER_NAME:-elasticsearch-default}
export NODE_MASTER=${NODE_MASTER:-true}
export NODE_DATA=${NODE_DATA:-true}
export HTTP_ENABLE=${HTTP_ENABLE:-true}
export MULTICAST=${MULTICAST:-true}

# allow for memlock
ulimit -l unlimited

# run
sudo -E -u elasticsearch /elasticsearch/bin/elasticsearch
