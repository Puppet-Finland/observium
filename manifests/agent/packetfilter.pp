#
# == Class: observium::agent::packetfilter
#
# A class for managing packet filtering rules for observium::agent
#
class observium::agent::packetfilter
(
    $ensure,
    $allow_addresses_ipv4,
    $allow_addresses_ipv6,
)
{
    observium::agent::packetfilter::allow_ipv4 { $allow_addresses_ipv4: ensure => $ensure, }
    observium::agent::packetfilter::allow_ipv6 { $allow_addresses_ipv6: ensure => $ensure, }
}
