#!/usr/bin/env bash

set -ev

$BLT_DIR/bin/blt artifact:deploy --commit-msg "Automated commit by Github Actions for Build $GITHUB_RUN_NUMBER of workflow $GITHUB_WORKFLOW" --tag "$GITHUB_REF_NAME-build" --no-interaction --verbose

set +v
