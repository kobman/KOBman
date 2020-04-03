#!/bin/bash

echo "Before..."
ls -latr ../releases/kobman-latest.zip


cd ~/KOBman/

sudo zip -rj releases/kobman-latest.zip src/main/bash/env/kobman-* src/main/bash/commands/kobman-* src/main/awk/git-describe


echo "....after."
ls -latr releases/kobman-latest.zip


