#! /bin/bash

ENTRY=${ENTRYPOINT}

if [[ -z ${ENTRY} ]]; then
  exit
fi

sudo nodetool decommission
#ssh armin@${ENTRYPOINT} sudo nodetool removenode $(sudo nodetool status | grep $(hostname -i | awk '{ print $1 }') | awk '{ print $7 }')
