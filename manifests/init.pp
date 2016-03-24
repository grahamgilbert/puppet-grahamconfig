class grahamconfig (
    $my_username  = 'grahamgilbert',
    $my_homedir   = '/Users/grahamgilbert',
    $my_sourcedir = '/Users/grahamgilbert/src',
    ){
        class {'grahamconfig::homebrew': }
        class {'grahamconfig::gems': } ->
        class {'grahamconfig::directories': } ->
        class {'grahamconfig::repositories': } ->
        class {'grahamconfig::config': } ->
        class {'grahamconfig::dock': } ->
        class {'grahamconfig::wallpaper': } ->
        class {'grahamconfig::fonts': } ->
        class {'grahamconfig::ssh_keys': } ->
        class {'grahamconfig::git': } ->
        class {'grahamconfig::osquery': } ->
        class {'grahamconfig::crashplan': }
        class {'grahamconfig::munki': }

}
