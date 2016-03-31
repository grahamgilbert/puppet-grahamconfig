class grahamconfig::homebrew {
    class {'homebrew':
        user  => 'grahamgilbert',
        group => 'staff',
    } ->

    exec { '/usr/local/bin/brew tap argon/mas':
        user => 'grahamgilbert',
        creates => '/usr/local/homebrew/Library/Taps/argon/homebrew-mas'
    } ->

    package {'youtube-dl':
        ensure   => 'latest',
        provider => 'brew',
    } ->

    # package {'argon/mas':
    #     ensure   => 'present',
    #     provider => 'tap',
    # } ->

    package {'mas':
        ensure   => 'latest',
        provider => 'brew',
    } ->

    package {'htop-osx':
        ensure   => 'latest',
        provider => 'brew',
    } ->

    package {'awscli':
        ensure   => 'latest',
        provider => 'brew',
    } ->

    package {'tree':
        ensure   => 'latest',
        provider => 'brew',
    }
}
