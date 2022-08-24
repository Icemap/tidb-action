#!/bin/sh

configParam=""
volumeParam=""

echo "INPUT_CONFIG: $INPUT_CONFIG"
echo "INPUT_PORT: $INPUT_PORT"
echo "INPUT_INNER_PORT: $INPUT_INNER_PORT"
echo "INPUT_VERSION: $INPUT_VERSION"

if [ ! -n "$INPUT_CONFIG" ]; then
  echo "Config empty, use default config to start TiDB"
else
	echo "Release config to 'tidb.yaml'"
	echo ${INPUT_CONFIG} > tidb.yaml
	configParam="-config /tidb.yaml"
	volumeParam="-v ${PWD}/tidb.yaml:/tidb.yaml"
fi

sh -c "docker run -d ${volumeParam} -p ${INPUT_PORT}:${INPUT_INNER_PORT} pingcap/tidb:${INPUT_VERSION} ${configParam}"