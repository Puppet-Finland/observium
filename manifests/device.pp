#
# == Class: observium::device
#
# This class is used to export an Exec resource that adds this node to Observium.
#
class observium::device
(
    $observium_basedir,
    $community,
    $snmp_ver
)
{

    # This command will get run on every Puppet run on every node. However, it 
    # should be fairly cheap and the alternative (mysql + grep) is probably not 
    # better and might break in the future.
    @@exec { "Add ${::fqdn} to Observium":
        command => "${observium_basedir}/add_device.php ${::fqdn} ${community} ${snmp_ver}",
        path => [ "${observium_basedir}", "/bin", "/sbin", "/usr/bin", "/usr/sbin", "/usr/local/bin", "usr/local/sbin" ],
        user => 'root',
        tag => 'observium-add_device',
    }
}
