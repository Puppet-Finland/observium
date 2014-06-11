#
# == Define: observium::agent::packetfilter::allow_ipv6
#
# These rules affect connections to the Observium Unix Agent
#
define observium::agent::packetfilter::allow_ipv6 {

    firewall { "016 ipv6 accept observium unix agent port from ${title}":
        provider => 'ip6tables',
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
