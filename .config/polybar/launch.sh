#!/usr/bin/env bash

killall -q polybar
echo "---" | tee -a /tmp/polymain.log
polybar main 2>&1 | tee -a /tmp/polymain.log & disown
