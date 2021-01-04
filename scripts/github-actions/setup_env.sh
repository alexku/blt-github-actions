#!/usr/bin/env bash

set -ev

export PATH=${COMPOSER_BIN}:$PATH

# Prepare ssh config for deployment to Acquia Cloud.
mkdir -p ~/.ssh
touch ~/.ssh/config
chmod 600 ~/.ssh/config
# Trust all Acquia git/svn hosts.
printf "Host *.enterprise-g1.hosting.acquia.com\n  StrictHostKeyChecking no\n" >> ~/.ssh/config
# Github actions will run steps as root.
# Related to https://github.community/t/how-to-run-action-as-a-non-root-user/17572
mkdir -p /root/.ssh
cp ~/.ssh/config /root/.ssh/config

# Set the git configuration
git config --global user.name "github-actions-CI"
git config --global user.email "noreply@github.com"

# Up the PHP Memory Limit
touch /usr/local/etc/php/conf.d/docker-php-ext-ci.ini
echo 'memory_limit = -1' >> /usr/local/etc/php/conf.d/docker-php-ext-ci.ini

# Create a MySQL database for drupal to use
MYSQL_ROOT_COMMAND="mysql --user=root --password=$MYSQL_ROOT_PASSWORD --host=$MYSQL_HOST --protocol=tcp"
echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE_NAME\`;" | $MYSQL_ROOT_COMMAND
echo "CREATE USER '$MYSQL_USER_NAME'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" | $MYSQL_ROOT_COMMAND
echo "GRANT ALL ON $MYSQL_DATABASE_NAME.* TO '$MYSQL_USER_NAME'@'%';" | $MYSQL_ROOT_COMMAND
echo "FLUSH PRIVILEGES;" | $MYSQL_ROOT_COMMAND

# Print databases which drupal user can see for debugging
echo "SHOW DATABASES;" | mysql --user="$MYSQL_USER_NAME" --password="$MYSQL_USER_PASSWORD" --host="$MYSQL_HOST" --protocol=tcp

set +v
