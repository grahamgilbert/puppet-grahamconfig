class grahamconfig::dock (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    outset::login_every{'Dock.sh':
        script => 'puppet:///modules/grahamconfig/dock/dock.sh'
    }

    if $::sp_serial_number == 'C02PW1LAFVH8'{
        outset::login_every{'work-dock.sh':
            script   => 'puppet:///modules/grahamconfig/dock/work-dock.sh',
            priority => 20,
        }
    }
}
