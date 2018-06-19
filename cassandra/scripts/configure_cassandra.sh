#! /bin/bash

CLUSTER=${clustername}

sudo /etc/init.d/cassandra stop
sed -i "s/Test Cluster/${CLUSTER}/g" /etc/cassandra/cassandra.yaml
sed -i "s/SimpleSnitch/GossipingPropertyFileSnitch/g" /etc/cassandra/cassandra.yaml
sed -i "s/127.0.0.1/$(hostname -i)/g" /etc/cassandra/cassandra.yaml

