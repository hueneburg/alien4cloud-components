#! /bin/bash

echo configuring > /var/log/armin_install

ENTRY=${ENTRYPOINT}

if [[ -z ${ENTRY} ]]; then
  exit
fi

hostname=$(hostname -i | awk '{ print $1 }')

sudo sed -i -E "s/- seeds: .*/- seeds: \"${ENTRY}\,${hostname}"/" /etc/cassandra/cassandra.yaml
