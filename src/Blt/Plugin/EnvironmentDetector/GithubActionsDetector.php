<?php

namespace Acquia\GithubActions\Blt\Plugin\EnvironmentDetector;

use Acquia\Blt\Robo\Common\EnvironmentDetector;

class GithubActionsDetector extends EnvironmentDetector {
    public static function getCiEnv() {
        return isset($_ENV['CI']) ? 'GITHUB_ACTIONS' : null;
    }

    public static function getCiSettingsFile(): string {
        return sprintf('%s/vendor/alexku/blt-github-actions/settings/github.settings.php', dirname(DRUPAL_ROOT));
    }
}
