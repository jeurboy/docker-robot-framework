#!/bin/bash
set -e

# Set the defaults
DEFAULT_RES="1280x1024x24"
DEFAULT_DISPLAY=":"99
RES=${RES:-$DEFAULT_RES}
DISPLAY=${DISPLAY:-$DEFAULT_DISPLAY}
ROBOT_TESTS=${ROBOT_TESTS:-$ROBOT_TESTS}


# Start Xvfb
echo -e "Starting Xvfb on display ${DISPLAY} with res ${RES}"
#Xvfb ${DISPLAY} -ac -screen 0 ${RES} -nolisten tcp&

Xvfb ${DISPLAY} -ac -screen 0 ${RES} &
export DISPLAY=${DISPLAY}

echo -e "Executing robot tests"
pybot --variable BROWSER:${BROWSER} ${ROBOT_TESTS}

# Stop Xvfb
kill -9 $(pgrep Xvfb)
