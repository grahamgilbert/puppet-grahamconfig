class grahamconfig::ssh_keys (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    file { "/Users/${my_username}/.ssh/ggmbpkey.pem":
        source => "/Users/${my_username}/Dropbox/Config/AWS Keys/Personal/ggmbpkey.pem",
        owner => "${my_username}",
        mode => '0600',
        # require => Repository['oh-my-zsh'],
    }

    file { "/Users/${my_username}/.ssh/config":
        source => "/Users/${my_username}/Dropbox/Config/SSH Keys/ssh_config",
        owner => "${my_username}",
        mode => '0600',
        # require => Repository['oh-my-zsh'],
    }

    file { "/Users/${my_username}/.ssh/GG_USE1.pem":
        source => "/Users/${my_username}/Dropbox/Config/AWS Keys/Work/GrahamGilbertUS-E1.pem",
        owner => "${my_username}",
        mode => '0600',
        # require => Repository['oh-my-zsh'],
    }

    file { "/Users/${my_username}/.ssh/id_rsa":
        source => "/Users/${my_username}/Dropbox/Config/SSH Keys/id_rsa",
        owner => "${my_username}",
        mode => '0600',
    }

    file { "/Users/${my_username}/.ssh/id_rsa.pub":
        source => "/Users/${my_username}/Dropbox/Config/SSH Keys/id_rsa.pub",
        owner => "${my_username}",
        mode => '0644',
    }

    file { "/Users/${my_username}/.ssh":
        ensure => directory,
    }

    file { "/Users/${my_username}/.aws":
        ensure => directory,
    }

    file { "/Users/${my_username}/.aws/config":
        source => "/Users/${my_username}/Dropbox/Config/AWS Keys/cli/config",
        owner => "${my_username}",
        mode => '0600',
    }

    file { "/Users/${my_username}/.aws/credentials":
        source => "/Users/${my_username}/Dropbox/Config/AWS Keys/cli/credentials",
        owner => "${my_username}",
        mode => '0600',
    }
}
