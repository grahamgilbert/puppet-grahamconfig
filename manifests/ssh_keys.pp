class grahamconfig::dock (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

        file { "/Users/${my_username}/.ssh/ggmbpkey.pem":
        source => "/Users/${my_username}/Dropbox/Config/AWS Keys/Personal/ggmbpkey.pem",
        owner => "${my_username}",
        mode => '0600',
        require => Repository['oh-my-zsh'],
    }
    
    file { "/Users/${my_username}/.ssh/Moving_Brands_EC2.pem":
        source => "/Users/${my_username}/Dropbox/Config/AWS Keys/Work/Moving Brands EC2.pem",
        owner => "${my_username}",
        mode => '0600',
        require => Repository['oh-my-zsh'],
    }
    
    file { "/Users/${my_username}/.ssh/pebble.pem":
        source => "/Users/${my_username}/Dropbox/Config/AWS Keys/Work/pebble.pem",
        owner => "${my_username}",
        mode => '0600',
        require => Repository['oh-my-zsh'],
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
}