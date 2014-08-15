#
# Puppet file for php_composer module
# Created: Thu Aug 14 21:51:10 EDT 2014
# Author: marsegm
#
# Requires
# * curl
# * php54w
#
# Parameters
# * composer_url: where to download composer from
# * install_dir: where to install composer to
#
class php_composer (
  $composer_url = $php_composer::params::url,
  $install_dir  = $php_composer::params::install_dir,
) inherits php_composer::params {

  # install composer
  exec { 'install_composer' :
    command => "/usr/bin/curl -sS ${composer_url} | \
      php -- --install-dir=${install_dir}; \
      mv ${install_dir}/composer.phar ${install_dir}composer",
    require => [
      Package['curl'],
      Package['php'],
    ],
  }

}
