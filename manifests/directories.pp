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

    if !defined(File["${my_sourcedir}/Mine"]){
        file {"${my_sourcedir}/Mine":
            ensure => directory,
        }
    }

    if !defined(File["${my_sourcedir}/Others"]){
        file {"${my_sourcedir}/Others":
            ensure => directory,
        }
    }

    if !defined(File["${my_sourcedir}/Work"]){
        file {"${my_sourcedir}/Work":
            ensure => directory,
        }
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
