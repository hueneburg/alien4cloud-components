#! /bin/bash

echo scaling >> ~/armin_install
echo ${entrypoint} >> ~/armin_install

ENTRY=${entrypoint}

if [[ -z ${ENTRY} ]]; then
  exit
fi

hostname=$(hostname -i | awk '{ print $1 }')

sudo sed -i -E "s/- seeds: .*/- seeds: \"${ENTRY}\,${hostname}"/" /etc/cassandra/cassandra.yaml
