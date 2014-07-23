class grahamconfig::vagrant (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username


    $license = "${my_homedir}/Dropbox/Config/Vagrant/fusion-6-license.lic"

    File {
        owner => $my_username,
        group => 'staff'
    }

    file { "/Users/${my_username}/.vagrant.d":
        ensure => directory,
    }

    file { "/Users/${my_username}/.vagrant.d/license-vagrant-vmware-fusion.lic":
      ensure  => present,
      mode    => '0644',
      source  => $license,
    }

    vagrant_plugin { 'vagrant-vmware-fusion':
        ensure => present
    }
}
