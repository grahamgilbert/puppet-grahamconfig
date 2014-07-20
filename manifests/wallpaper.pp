class grahamconfig::wallpaper (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    scriptrunner::every{'wallpaper':
        script => 'puppet:///modules/grahamconfig/wallpaper/set_wallpaper'
    }

    file {'/Library/Management/bin/set_desktops.py':
        owner  => root,
        group  => wheel,
        mode   => '0755',
        source => 'puppet:///modules/grahamconfig/wallpaper/set_desktops.py'
    }
}
