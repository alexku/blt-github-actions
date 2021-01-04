<?php

/**
 * @file
 * Github Actions environment specific settings.
 */

/**
 * Overwrite CI default database host name.
 *
 * @see ci.settings.php
 */
$databases['default']['default']['host'] = 'database';
$databases['default']['default']['password'] = 'drupal';
$databases['default']['default']['username'] = 'drupal';
$databases['default']['default']['database'] = 'drupal';
