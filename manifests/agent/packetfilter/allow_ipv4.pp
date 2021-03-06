#
# == Define: observium::agent::packetfilter::allow_ipv4
#
# These rules affect connections to the Observium Unix Agent
#
define observium::agent::packetfilter::allow_ipv4
(
    $ensure
)
{

    firewall { "016 ipv4 accept observium unix agent port from ${title}":
        ensure => $ensure,
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $title ? {
            'any' => undef,
            default => $title,
        },
        dport => 36602,
        action => 'accept',
    }
}
