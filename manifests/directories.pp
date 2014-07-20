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

    file {"/Users/${::luser}/src/Mine":
        ensure => link,
        target => "/Users/${my_username}/Dropbox/src/Mine",
    }

    file {"/Users/${::luser}/src/Others":
        ensure => link,
        target => "/Users/${my_username/Dropbox/src/Others",
    }

    file {"/Users/${::luser}/src/Work":
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
