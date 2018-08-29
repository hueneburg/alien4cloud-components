#! /bin/bash

sudo /etc/init.d/mongodb stop

ip=$(hostname -i | awk '{ print $1 }')

function first_machine() {
  echo "sharding:" > confsrv.conf
  echo "    clusterRole: configsvr" >> confsrv.conf
  echo "net:" >> confsrv.conf
  echo "    bindIp: 0.0.0.0" >> confsrv.conf
  echo "    port: 42001" >> confsrv.conf

  echo "sharding:" > router.conf
  echo "    configDB: localhost:42001" >> router.conf
  echo "net:" >> router.conf
  echo "    bindIp: 0.0.0.0" >> router.conf
  echo "    port: 27017" >> router.conf

  echo "sharding:" > shard.conf
  echo "    clusterRole: shardsvr" >> shard.conf
  echo "replication:" >> shard.conf
  echo "    replSetName: ${REPL_SET_NAME}" >> shard.conf
  echo "net:" >> shard.conf
  echo "    bindIp: 0.0.0.0" >> shard.conf
  echo "    port: 42002" >> shard.conf

  sudo mkdir -p /data/configdb
  sudo mkdir -p /data/db
}

function extra_machine() {
  echo "sharding:" > shard.conf
  echo "    clusterRole: shardsvr" >> shard.conf
  echo "replication:" >> shard.conf
  echo "    replSetName: ${REPL_SET_NAME}" >> shard.conf
  echo "net:" >> shard.conf
  echo "    bindIp: 0.0.0.0" >> shard.conf
  echo "    port: 27017" >> shard.conf

  sudo mkdir -p /data/db
  sudo mongod --config shard.conf > shardsvr.log &

  mongo --host ${ENTRYPOINT} --eval "sh.addShard('"${ip}"')"
}

if [[ -z ${ENTRYPOINT} ]]; then
  first_machine
else
  extra_machine
fi
