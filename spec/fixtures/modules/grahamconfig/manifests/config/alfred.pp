class grahamconfig::config::alfred (
    ){

    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    mac_admin::osx_defaults { 'Set Alfred theme to Lion':
        domain  => 'com.runningwithcrayons.Alfred-Preferences',
        key     => 'appearance.theme',
        value   => 'alfred.theme.lion',
        user    => $my_username,
    }

}