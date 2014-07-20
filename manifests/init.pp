class grahamconfig (
    $my_username  = 'grahamgilbert',
    $my_homedir   = '/Users/grahamgilbert',
    $my_sourcedir = '/Users/grahamgilbert/src',
    ){
    class {'grahamconfig::directories': } ->
    class {'grahamconfig::config': } ->
    class {'grahamconfig::dock': } ->
    class {'grahamconfig::wallpaper': }
}
