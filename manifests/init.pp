class grahamconfig (
    $my_username  = 'grahamgilbert',
    $my_homedir   = '/Users/grahamgilbert',
    $my_sourcedir = '/Users/grahamgilbert/src',
    ){
    class {'grahamconfig::config': } ->
    class {'grahamconfig::dock': }
}
