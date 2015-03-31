#
# == Class: observium::agent
#
# Install and configure the Observium Unix Agent
#
# == Parameters
#
# [*ensure*]
#   The status of Observium Agent. Valid values are 'present' (default) and 'absent'.
# [*allow_addresses_ipv4*]
#   An array of IPv4 addresses/subnets from which to allow connections. Only 
#   affects packet filtering rules. Defaults to ['127.0.0.1'].
# [*allow_addresses_ipv6*]
#   An array of IPv6 addresses/subnets from which to allow connections. Only 
#   affects packet filtering rules. Defaults to ['::1'].
#
class observium::agent
(
    $ensure = 'present',
    $allow_addresses_ipv4 = ['127.0.0.1'],
    $allow_addresses_ipv6 = ['::1']
)
{
if hiera('manage_observium_agent', 'true') != 'false' {

    # Currently the Unix Agent is quite Debian/Ubuntu-specific. This may change 
    # in the future, but until then not managing it on other platforms is 
    # probably safest.
    if $::osfamily == 'Debian' {
        class { 'observium::agent::install':
            ensure => $ensure,
        }

        class { 'observium::agent::service':
            ensure => $ensure,
            allow_addresses_ipv4 => $allow_addresses_ipv4,
            allow_addresses_ipv6 => $allow_addresses_ipv6,
        }

        if tagged('packetfilter') {
            class { 'observium::agent::packetfilter':
                ensure => $ensure,
                allow_addresses_ipv4 => $allow_addresses_ipv4,
                allow_addresses_ipv6 => $allow_addresses_ipv6,
            }
        }

    }
}
}
