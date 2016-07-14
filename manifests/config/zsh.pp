class grahamconfig::config::zsh (
    ){

    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    osx_chsh { $my_username:
        shell   => '/bin/zsh',
    }

    # repository { 'oh-my-zsh':
    #     source => 'grahamgilbert/oh-my-zsh',
    #     path   => "/Users/${my_username}/.oh-my-zsh",
    #     ensure => '564e36d770883c2e64d2d9946632f22332e98e90',
    #  }

    # file {"/Users/${my_username}/.oh-my-zsh":
    #     owner   => $my_username,
    #     recurse => true,
    #     require => Repository['oh-my-zsh'],
    # }

    # repository {'prezto':
    #     source => 'grahamgilbert/prezto',
    #     path   => "/Users/${my_sourcedir}/Mine/prezto",
    #     ensure => '23f6a593f7abfc16eb15a9342528ee8721ba8bb0',
    # }

    file {"/Users/${my_username}/.zprezto":
        owner   => $my_username,
        recurse => true,
        # require => Repository['prezto'],
        ensure => link,
        target  => "${my_sourcedir}/Mine/prezto"
    }

    file { "/Users/${my_username}/.zlogin":
        ensure  => link,
        target  => "${my_sourcedir}/Mine/prezto/runcoms/zlogin",
        # require => Repository['oh-my-zsh'],
        owner   => $my_username,
    }

    file { "/Users/${my_username}/.zlogout":
        ensure  => link,
        target  => "${my_sourcedir}/Mine/prezto/runcoms/zlogout",
        # require => Repository['oh-my-zsh'],
        owner   => $my_username,
    }

    file { "/Users/${my_username}/.zpreztorc":
        ensure  => link,
        target  => "${my_sourcedir}/Mine/prezto/runcoms/zpreztorc",
        # require => Repository['prezto'],
        owner   => $my_username,
    }

    file { "/Users/${my_username}/.zprofile":
        ensure  => link,
        target  => "${my_sourcedir}/Mine/prezto/runcoms/zprofile",
        # require => Repository['prezto'],
        owner   => $my_username,
    }

    file { "/Users/${my_username}/.zshenv":
        ensure  => link,
        target  => "${my_sourcedir}/Mine/prezto/runcoms/zshenv",
        # require => Repository['prezto'],
        owner   => $my_username,
    }

    file { "/Users/${my_username}/.zshrc":
        ensure  => link,
        target  => "${my_sourcedir}/Mine/prezto/runcoms/zshrc",
        # require => Repository['prezto'],
        owner   => "${my_username}",
    }

    file {"/Users/${my_username}/.terraform_secrets":
        ensure => link,
        target => "/Users/${my_username}/Dropbox/Config/Terraform/secrets",
        owner  => "${my_username}",
    }

    # file { "/Users/${my_username}/.zshrc":
    #     ensure  => link,
    #     target  => "/Users/${my_username}/.oh-my-zsh/grahams-zshrc",
    #     require => Repository['oh-my-zsh'],
    #     owner   => $my_username,
    # }

}
