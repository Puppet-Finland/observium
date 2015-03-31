#
# == Class: observium::agent::service
#
# Setup the Observium Unix Agent service
#
class observium::agent::service
(
    $ensure,
    $allow_addresses_ipv4,
    $allow_addresses_ipv6
)
{
    include xinetd
    include xinetd::params

    file { 'observium-observium_agent_xinetd':
        name => "${::xinetd::params::service_dir}/observium_agent_xinetd",
        content => template('observium/observium_agent_xinetd.erb'),
        ensure => $ensure,
        owner => root,
        group => root,
        mode => 644,
        require => Class['xinetd::install'],
        notify => Class['xinetd::service'],
    }
}
