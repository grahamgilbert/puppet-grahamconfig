class grahamconfig::homebrew {
    class {'homebrew':
      user  => 'grahamgilbert',
      group => 'staff',
    }

    package {'youtube-dl':
        ensure   => 'latest',
        provider => 'brew',
    }
}
