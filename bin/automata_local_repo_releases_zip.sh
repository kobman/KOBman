#!/bin/bash

echo "Before..."
ls -latr ../releases/kobman-latest.zip


cd ~/KOBman/

#sudo zip -rj ../releases/kobman-latest.zip ../src/main/bash/env/kobman-* ../src/main/bash/commands/kobman-*
sudo zip -rj releases/kobman-latest.zip src/main/bash/env/kobman-* src/main/bash/commands/kobman-*

#cd ~/KOBman/releases/
#sudo mv -i kobman-0.1.zip kobman-0.2.zip
#sudo mv -i kobman-latest.zip kobman-0.1.zip




echo "....after."
ls -latr releases/kobman-latest.zip


