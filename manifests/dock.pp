class grahamconfig::dock (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    outset::every{'Dock.sh':
        script => 'puppet:///modules/grahamconfig/dock/dock.sh'
    }

    if $::macosx_productversion == '10.10'{
        outset::every{'Safari-dock.sh': 
            script => 'puppet:///modules/grahamconfig/dock/safari-dock.sh',
            ensure => absent,
        }
    }
}
