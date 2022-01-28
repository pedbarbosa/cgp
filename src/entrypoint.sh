#!/bin/bash

set -e

if [ -z "$@" ]; then
  exec apache2-foreground
else
  exec $@
fi

