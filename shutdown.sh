#!/bin/sh

RUN=$(basename $0)
if [ "$RUN" == "reboot" ]; then
  CMD="reboot"
elif [ "$RUN" == "halt" ]; then
  CMD="poweroff"
else
  echo "ERROR: Unsupported command"
  exit 1
fi

echo "Performs host ${CMD} operation."
ssh -i /root/.ssh/open-vm-tools \
  -o StrictHostKeyChecking=no \
  root@localhost "${CMD}"
