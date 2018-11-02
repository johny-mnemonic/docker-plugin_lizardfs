#!/bin/sh

image_tag=$1

log_prefix="[Root]"

echo "$log_prefix Creating Test Environment"
/test-environment.sh $image_tag
echo "$log_prefix Test Environment created. Running docker with PID: `cat /run/dockerd-entrypoint.pid`"

echo "$log_prefix Running Tests"
/test-run.sh

echo "$log_prefix All done. Stopping Docker"
kill -SIGTERM $(cat /run/dockerd-entrypoint.pid)
