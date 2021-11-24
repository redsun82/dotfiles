#!/bin/bash -e

cd $(dirname $0)

for s in setup.d/*.sh; do
  . $s
done
