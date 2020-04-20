#!/bin/bash

function __kob_list {
echo "printing namespace"
echo $KOBMAN_NAMESPACE
curl -L "https://raw.githubusercontent.com/${KOBMAN_NAMESPACE}/KOBman/master/dist/list" | less


}
