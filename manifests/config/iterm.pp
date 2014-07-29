class grahamconfig::config::iterm (
    ){

    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    # Set up iTerm Preferences
    mac_admin::osx_defaults { 'Load iTerm prefences from a custom folder':
        domain => 'com.googlecode.iterm2',
        key    => 'LoadPrefsFromCustomFolder',
        type   => 'bool',
        value  => 'true',
        user    => $my_username,
    }

    mac_admin::osx_defaults { 'Load iTerm prefences from Dropbox':
        domain => 'com.googlecode.iterm2',
        key    => 'PrefsCustomFolder',
        value  => "$my_homedir/Dropbox/Apps/iTerm",
        user   => $my_username,
    }

    mac_admin::osx_defaults {'Always sync local iTerm preferences to Dropbox':
        domain => 'com.googlecode.iterm2',
        key    => 'NoSyncNeverRemindPrefsChangesCopy',
        type   => 'bool',
        value  => 'true',
        user   => $my_username,
    }

}