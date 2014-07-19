class grahamconfig (
    $my_username  = 'grahamgilbert',
    $my_homedir   = "/Users/${my_username}",
    $my_sourcedir = "${my_homedir}/src",
    ){
    class {'grahamconfig::config':}
}
