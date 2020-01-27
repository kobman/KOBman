#!/bin/bash

echo "Before..."
ls -latr ../releases/kobman-test.zip


sudo zip -rj ../releases/kobman-test.zip ../tests/envs/test-kob-[gkt]* ../tests/commands/test-kob-[hilsuv]*



echo "....after."
ls -latr ../releases/kobman-test.zip

