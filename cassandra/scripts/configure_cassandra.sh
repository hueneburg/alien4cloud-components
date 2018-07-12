#! /bin/bash

echo test >> ~/armin_install

CLUSTER=${name}

hostname=$(hostname -i | awk '{ print $1 }')

sudo /etc/init.d/cassandra stop
# Clear data
sudo rm -rf /var/lib/cassandra/data/*
# Clean logs
sudo rm -rf /var/log/cassandra/gc* /var/log/cassandra/system.log

echo ${CLUSTER} >> ~/armin_install

sudo sed -i -E "s/(Cassandra[ -])?Test[ -]Cluster/${CLUSTER}/Ig" /etc/cassandra/cassandra.yaml
sudo sed -i "s/SimpleSnitch/GossipingPropertyFileSnitch/g" /etc/cassandra/cassandra.yaml
sudo sed -i "s/127.0.0.1/${hostname}/g" /etc/cassandra/cassandra.yaml
sudo sed -i "s/localhost/${hostname}/g" /etc/cassandra/cassandra.yaml

echo configuring >> ~/armin_install
echo scaling >> ~/armin_install
echo ${entrypoint} >> ~/armin_install

ENTRY=${entrypoint}

if [[ -z ${ENTRY} ]]; then
  exit
fi

echo still >> ~/armin_install

hostname=$(hostname -i | awk '{ print $1 }')

echo hostname >> ~/armin_install

sudo sed -i -E "s/- seeds: .*/- seeds: \"${ENTRY}\,${hostname}"/" /etc/cassandra/cassandra.yaml 2>~/armin_error

echo "done" >> ~/armin_install
