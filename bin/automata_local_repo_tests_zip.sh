#!/bin/bash

echo "Before..."
ls -latr ../releases/kobman-test.zip


sudo zip -rj ../releases/kobman-test.zip ../tests/

# sudo zip -rj ../releases/kobman-test.zip ../tests/env/test-kob-[gkt]* ../tests/commands/test-kob-[hilsuv]*



echo "....after."
ls -latr ../releases/kobman-test.zip

