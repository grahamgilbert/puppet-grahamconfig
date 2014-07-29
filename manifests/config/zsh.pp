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
        ensure => 'cbabe35ea03432046f03657a8dbde5f46634668d',
     }

     file {"/Users/${my_username}/.oh-my-zsh":
        owner   => $my_username,
        recurse => true,
        require => Repository['oh-my-zsh'],
    }

    file { "/Users/${my_username}/.zshrc":
        ensure  => link,
        target  => "/Users/${my_username}/.oh-my-zsh/grahams-zshrc",
        require => Repository['oh-my-zsh'],
        owner   => $my_username,
    }

}