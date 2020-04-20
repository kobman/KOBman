#!/bin/bash

function __kob_list {
echo "printing namespace"
echo $KOBMAN_NAMESPACE
curl -L "${KOBMAN_SERVICE}/${KOBMAN_NAMESPACE}/KOBman/master/dist/list" | less


}
