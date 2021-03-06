# == Class: rails
#
# Class to install Ruby on Rails.
#
# === Authors
#
# Włodzimierz Gajda <gajdaw@gajdaw.pl>
#
# === Copyright
#
# Copyright 2015 Włodzimierz Gajda
#

class rails {

    # validate_platform() function comes from
    # puppet module gajdaw/diverse_functions
    #
    #     https://forge.puppetlabs.com/gajdaw/diverse_functions
    #
    if !validate_platform($module_name) {
        fail("Platform not supported in module '${module_name}'.")
    }

    if defined(Package['libsqlite3-dev']) == false {
        package { 'libsqlite3-dev': ensure => present }
    }

    if defined(Package['gem']) == false {
        package { 'gem': ensure => present }
    }

    exec { 'rails::rails':
        command => 'gem install rails',
        timeout => 6000,
        path    => '/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin',
        require => Package['gem']
    }

    exec { 'rails::gem-sqlite3':
        command => 'gem install sqlite3 -v "1.3.9"',
        path    => '/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin',
        require => [Package['gem', 'libsqlite3-dev'], Exec['rails::rails']]
    }

}
