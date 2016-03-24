class grahamconfig::wallpaper (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    if $::sp_local_host_name == "Artoo" {
        outset::login_every{'wallpaper.sh':
            script => 'puppet:///modules/grahamconfig/wallpaper/set_wallpaper_home.sh'
        }
    }else{
        outset::login_every{'wallpaper.sh':
            script => 'puppet:///modules/grahamconfig/wallpaper/set_wallpaper_work.sh'
        }
    }

    file {'/Library/Management/bin/set_desktops.py':
        owner  => root,
        group  => wheel,
        mode   => '0755',
        source => 'puppet:///modules/grahamconfig/wallpaper/set_desktops.py'
    }
}
