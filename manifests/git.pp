class grahamconfig::git (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    git::config::global{ 'credential.helper':
        value => 'osxkeychain',
    }

    git::config::global{ 'user.name':
        value => 'Graham Gilbert',
    }

    git::config::global{ 'user.email':
        value => 'graham@grahamgilbert.com',
    }
}
