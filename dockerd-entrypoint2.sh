#!/bin/sh

FIX_TRIES=0
fix_mtu() {
  # Wait a tick for docker to create the bridge.
  usleep 250000
  # Did it succeed and we can fix it?
  echo "Testing bridge existance"
  if [ `grep -q docker /proc/net/dev` ]; then
    echo "MTU: $DOCKER_MTU"
  else
    # 5 seconds(4t/1s X 5s = 20t) to keep checking before giving up.
    FIX_TRIES="$((FIX_TRIES + 1))"
    [ "$FIX_TRIES" -lt 20 ] && fix_mtu
  fi
}
fix_mtu&

source dockerd-entrypoint.sh
