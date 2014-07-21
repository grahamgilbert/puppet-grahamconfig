class grahamconfig::directories (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    File {
        owner => $my_username,
        group => 'staff'
    }

    if !defined(File["${my_sourcedir}"]){
        file {"${my_sourcedir}":
            ensure => directory,
        }
    }

    file {"${my_sourcedir}/Mine":
        ensure => link,
        target => "/Users/${my_username}/Dropbox/src/Mine",
    }

    file {"/Users/${my_username}/Dropbox":
        ensure => link,
        target => "/Users/${my_username}/Dropbox (Personal)",
        notify => Exec['Hide Dropbox'],
    }

    exec{'Hide Dropbox':
        command     => '/usr/bin/chflags hidden /Users/${my_username}/Dropbox'
        refreshonly => true
    }

    file {"${my_sourcedir}/Others":
        ensure => link,
        target => "/Users/${my_username}/Dropbox/src/Others",
    }

    file {"${my_sourcedir}/Work":
        ensure => link,
        target => "/Users/${my_username}/Dropbox/src/Work",
    }

    if !defined(File['/Library/Management']){
        file {'/Library/Management':
            ensure => directory,
        }
    }

    if !defined(File['/Library/Management/bin']){
        file {'/Library/Management/bin':
            ensure => directory,
        }
    }
}
