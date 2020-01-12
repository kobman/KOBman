#!/bin/bash

echo "Before..."
ls -latr ../releases/kobman-latest.zip

sudo mv -i kobman-0.1.zip kobman-0.2.zip
sudo mv -i kobman-latest.zip kobman-0.1.zip

sudo zip -rj ../releases/kobman-latest.zip ../src/main/bash/env/kobman-* ../src/main/bash/commands/kobman-*



echo "....after."
ls -latr ../releases/kobman-latest.zip


