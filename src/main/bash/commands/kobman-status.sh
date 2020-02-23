#!/bin/bash


function __kob_status {

sudo rm ${KOBMAN_CANDIDATES_DIR}/*.tar.gz 2> /dev/null
sudo rm ${KOBMAN_CANDIDATES_DIR}/source-to-image-v1.1.14-874754de-linux-amd64.tar.gz.* 2> /dev/null
sudo figlet status -f small
sudo ls ${KOBMAN_CANDIDATES_DIR}
}
