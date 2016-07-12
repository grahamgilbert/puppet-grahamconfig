class grahamconfig::homebrew {
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username
    class {'homebrew':
        user  => "${my_username}",
        group => 'staff',
    } ->

    package {'youtube-dl':
        ensure   => 'present',
        provider => 'brew',
    } ->

    package {'htop-osx':
        ensure   => 'present',
        provider => 'brew',
    } ->

    package {'awscli':
        ensure   => 'present',
        provider => 'brew',
    } ->

    package {'tree':
        ensure   => 'present',
        provider => 'brew',
    } ->

    package {'terraform':
        ensure   => 'present',
        provider => 'brew',
    }
}
