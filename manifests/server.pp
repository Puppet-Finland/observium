#
# == Class: observium::server
#
# This class is included on the Observium server. Currently it's only purpose is 
# to automatically add all Puppet-managed nodes to the Observium database.
#
class observium::server {

    # Add all Puppet-managed nodes ("devices") to Observium
    Exec <<| tag == 'observium-add_device' |>>
}
