class grahamconfig::fonts (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    file {"${my_homedir}/Library/Fonts":
        ensure => 'directory',
        recurse => true,
        source => "/Users/${my_username}/Dropbox/Config/Fonts"
    }
}
