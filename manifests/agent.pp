#
# == Class: observium::agent
#
# Install and configure the Observium Unix Agent
#
class observium::agent
(
    $allow_addresses_ipv4 = ['127.0.0.1'],
    $allow_addresses_ipv6 = ['::1']
)
{
if hiera('manage_observium_agent', 'true') != 'false' {

    # Currently the Unix Agent is quite Debian/Ubuntu-specific. This may change 
    # in the future, but until then not managing it on other platforms is 
    # probably safest.
    if $::osfamily == 'Debian' {
        include observium::agent::install

        class { 'observium::agent::service':
            allow_addresses_ipv4 => $allow_addresses_ipv4,
            allow_addresses_ipv6 => $allow_addresses_ipv6,
        }

        if tagged('packetfilter') {
            class { 'observium::agent::packetfilter':
                allow_addresses_ipv4 => $allow_addresses_ipv4,
                allow_addresses_ipv6 => $allow_addresses_ipv6,
            }
        }

    }
}
}
