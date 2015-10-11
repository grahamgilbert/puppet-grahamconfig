class grahamconfig::config::zsh (
    ){

    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    osx_chsh { $my_username:
        shell   => '/bin/zsh',
    }

    repository { 'oh-my-zsh':
        source => 'grahamgilbert/oh-my-zsh',
        path   => "/Users/${my_username}/.oh-my-zsh",
        ensure => '564e36d770883c2e64d2d9946632f22332e98e90',
     }

    file {"/Users/${my_username}/.oh-my-zsh":
        owner   => $my_username,
        recurse => true,
        require => Repository['oh-my-zsh'],
    }

    repository {'prezto':
        source => 'grahamgilbert/prezto',
        path   => "/Users/${my_username}/.prezto",
        ensure => latest,
    }

    file {"/Users/${my_username}/.prezto":
        owner   => $my_username,
        recurse => true,
        require => Repository['prezto'],
    }

    file { "/Users/${my_username}/.zshrc":
        ensure  => link,
        target  => "/Users/${my_username}/.oh-my-zsh/grahams-zshrc",
        require => Repository['oh-my-zsh'],
        owner   => $my_username,
    }

}
