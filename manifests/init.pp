class grahamconfig (
    $my_username  = 'grahamgilbert',
    $my_homedir   = '/Users/grahamgilbert',
    $my_sourcedir = '/Users/grahamgilbert/src',
    ){
        if $facts['mac_current_user'] == 'graham_gilbert' {
        $my_username  = 'graham_gilbert',
        $my_homedir   = '/Users/graham_gilbert',
        $my_sourcedir = '/Users/graham_gilbert/src',
        }
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
