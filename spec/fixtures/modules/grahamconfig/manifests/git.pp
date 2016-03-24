class grahamconfig::git (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    $boxen_user = $my_username

    git::config::global{ 'credential.helper':
        value => 'osxkeychain',
    }

    git::config::global{ 'user.name':
        value => 'Graham Gilbert',
    }

    git::config::global{ 'user.email':
        value => 'graham@grahamgilbert.com',
    }

    if !defined(File['/usr/local/bin']){
        file {'/usr/local/bin':
            ensure => directory,
        }
    }

    file {'/usr/local/bin/git-fat':
        ensure => present,
        source => 'puppet:///modules/grahamconfig/git-fat',
        mode   => '0755',
        owner  => 0,
        group  => 0,
    }
}
