class grahamconfig::homebrew {
    class {'homebrew':
        user  => "${::grahamgconfig::my_username}",
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
    }
}
