#!/bin/sh
sed -e '/{} # from executor.json/ {' -e 'r executor.json' -e 'd' -e '}' "$1"
