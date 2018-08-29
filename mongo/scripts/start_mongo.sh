#!/bin/bash

if [[ -z ${ENTRYPOINT} ]]; then
  sudo mongod --config confsrv.conf > confsrv.log
  sudo mongos --config router.conf > router.log
fi
sudo mongod --config shard.conf > shard.log


