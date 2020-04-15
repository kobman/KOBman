#!/bin/bash

echo "Before..."
ls -latr ../releases/kobman-latest.zip


cd ~/KOBman/

sudo zip -rj releases/kobman-latest.zip src/main/bash/envs/kobman-* src/main/bash/commands/kobman-* 


echo "....after."
ls -latr releases/kobman-latest.zip


