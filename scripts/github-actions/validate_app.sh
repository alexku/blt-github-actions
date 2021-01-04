#!/usr/bin/env bash

set -ev

$BLT_DIR/bin/blt validate --define drush.alias='${drush.aliases.ci}' --ansi --verbose

set +v
