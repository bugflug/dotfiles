#!/usr/bin/env bash
DIR=$(dirname $(readlink -f $0))

# lib
. $DIR/lib/gen

# loading settings and all that
# order does matter!
. $DIR/init/envars
. $DIR/init/theme
. $DIR/init/display
. $DIR/init/launch
