#!/bin/bash

function __kob_list {
echo $KOBMAN_NAMESPACE
curl -L "https://raw.githubusercontent.com/${KOBMAN_NAMESPACE}/KOBman/master/dist/list" | less


}
