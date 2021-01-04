<?php

namespace Acquia\GithubActions\Blt\Plugin\Commands;

use Acquia\Blt\Robo\BltTasks;
use Acquia\Blt\Robo\Exceptions\BltException;
use Robo\Contract\VerbosityThresholdInterface;

/**
 * Defines commands related to Github Actions.
 */
class GithubActionsCommands extends BltTasks {

  /**
   * Initializes default Github Actions configuration for this project.
   *
   * @command recipes:ci:github-actions:init
   * @throws \Acquia\Blt\Robo\Exceptions\BltException
   */
  public function azureInit() {
    $source = $this->getConfigValue('repo.root') . '/vendor/alexku/blt-github-actions/workflows';
    $destination = $this->getConfigValue('repo.root') . '/.github/workflows';

    $result = $this->taskFilesystemStack()
      ->mkdir($this->getConfigValue('repo.root') . '/.github')
      ->taskCopyDir([$source => $destination])
      ->stopOnFail()
      ->setVerbosityThreshold(VerbosityThresholdInterface::VERBOSITY_VERBOSE)
      ->run();

    if (!$result->wasSuccessful()) {
      throw new BltException("Could not initialize Github Actions configuration.");
    }

    $this->say("<info>A pre-configured Github Actions workflow file was copied to your repository .github folder.</info>");
  }

}
