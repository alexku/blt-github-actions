#!/usr/bin/env bash

set -ev

$BLT_DIR/bin/blt setup --define drush.alias='${drush.aliases.ci}' --environment=ci --no-interaction --ansi --verbose

set +v
