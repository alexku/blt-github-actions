Acquia BLT Github Actions integration
====

This is an [Acquia BLT](https://github.com/acquia/blt) plugin providing [Github Actions](https://github.com/features/actions) integration.

This plugin is **community-created** and **community-supported**. Acquia does not provide any direct support for this software or provide any warranty as to its stability.

## Installation and usage

To use this plugin, you must already have a Drupal project using BLT 11.3 (or higher).

In your project, require the plugin with Composer:

`composer require alexku/blt-github-actions`

Initialize the Github Actions integration by calling `recipes:ci:github-actions:init`, which is provided by this plugin:

`blt recipes:ci:github-actions:init`

This will copy a template version of the default.yml to your project .github/workflows/ directory. Make sure to commit this as well as your updated composer.json to Git.

Note: the template YAML file assumes standard BLT steps for builds (and is similar to the templated Travis CI and Acquia Piplines files). Modifications can be made as necessary! Build scripts can also be modified by copying them out of this plugin and changing the file path as needed in the YAML file.

BLT plugin structure is based on https://github.com/mikemadison13/blt-gitlab-pipelines

# License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 2 as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
