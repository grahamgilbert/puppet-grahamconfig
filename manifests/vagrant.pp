class grahamconfig::vagrant (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    vagrant::plugin { 'vagrant-vmware-fusion':
        license => "${my_homedir}/Dropbox/Config/Vagrant/fusion-6-license.lic",
    }
}
