#!/bin/bash

function __kob_list {
curl -L "https://raw.githubusercontent.com/${KOBMAN_NAMESPACE}/KOBman/master/dist/list" | less


}
