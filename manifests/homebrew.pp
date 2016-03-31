class grahamconfig::homebrew {
    class {'homebrew':
      user  => 'grahamgilbert',
      group => 'staff',
    } ->

    package {'youtube-dl':
        ensure   => 'latest',
        provider => 'brew',
    } ->

    package {'argon/mas':
        ensure   => 'present',
        provider => 'tap',
    } ->

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
