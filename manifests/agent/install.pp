#
# == Class: observium::agent::install
#
# Install the Observium Unix Agent
#
class observium::agent::install {

    file { 'observium-observium_agent':
        name => '/usr/bin/observium_agent',
        content => template('observium/observium_agent'),
        ensure => present,
        owner => root,
        group => root,
        mode => 755,
    }

    file { 'observium-libdir':
        name => '/usr/lib/observium_agent',
        ensure => directory,
        owner => root,
        group => root,
        mode => 755,
    }

    file { 'observium-local_libdir':
        name => '/usr/lib/observium_agent/local',
        ensure => directory,
        owner => root,
        group => root,
        mode => 755,
        require => File['observium-libdir'],
    }
}
