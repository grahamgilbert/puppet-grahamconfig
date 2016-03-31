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
        ensure   => 'present',
        provider => 'brew',
    } ->

    # package {'argon/mas':
    #     ensure   => 'present',
    #     provider => 'tap',
    # } ->

    package {'mas':
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
