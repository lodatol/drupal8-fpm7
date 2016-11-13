# drupal8-fpm7
Docker container that install drupal 8 dependencies on the standard php:7-fpm


This is the Git repo for lodatol/drupal8-fpm7 container.

It add Drupal 8 libraries to the official php:7-fpm docker container.

The need of create this container instead of the official Drupal container is that:
- this container add drush
  - add drush requirements like wget, git
- does not download drupal inside the container
- this container add pecl upload progress
