#!/bin/bash

echo "Before..."
ls -latr ../kobman_zip_file.zip
sudo zip -rj ../kobman_zip_file.zip ../src/main/bash/env/kobman-* ../src/main/bash/commands/kobman-*
echo "....after."
ls -latr ../kobman_zip_file.zip


