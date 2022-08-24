#!/bin/sh

configParam=""

if [ -n "${INPUT_CONFIG}" ]; then
  echo "Config empty, use default config to start TiDB"
else
	echo "Release config to 'tidb.yaml'"
	echo ${INPUT_CONFIG} > tidb.yaml
	configParam="-config /tidb.yaml"
fi

sh -c "docker run -v ${PWD}/tidb.yaml:/tidb.yaml -p ${INPUT_PORT}:${INPUT_INNER_PORT} pingcap/tidb:${INPUT_VERSION} ${configParam}"