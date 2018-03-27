#!/bin/sh

# Wait a tick after startup for docker to create the bridge and then fix the docker bridge MTU. 
# This might be a bit error prone and a loop checking bridge existence might work better but has its own flaws. Name process mgmt and dockerd-entrypoint2.sh failure. 
fix_mtu() {
  sleep 2
  echo $DOCKER_MTU
}
fix_mtu&

source dockerd-entrypoint2.sh
