class grahamconfig::dock (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    scriptrunner::every{'Dock':
        script => 'puppet:///modules/grahamconfig/dock/dock.sh'
    }
}
