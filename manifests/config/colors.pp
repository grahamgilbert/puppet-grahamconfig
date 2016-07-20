class grahamconfig::config::colors (
    ){

    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    file {"/Users/${my_username}/Library/Colors":
        owner   => $my_username,
        ensure  => 'directory'
    }

    file {"/Users/${my_username}/Library/Colors/Airbnb Colors.clr":
        ensure => 'present',
        source => "/Users/${my_username}/Dropbox/Config/Colors/Airbnb Colors.clr",
        owner  => "${my_username}",
    }


}
