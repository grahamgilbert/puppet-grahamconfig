class grahamconfig::config (
    ){

    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    File {
        owner => $my_username,
        group => 'staff'
    }

    Mac_admin::Osx_defaults {
      user => $my_username,
    }

    mac_admin::osx_defaults { 'require password at screensaver':
        ensure => present,
        domain => 'com.apple.screensaver',
        key    => 'askForPassword',
        value  => 'true',
        type   => 'bool',
        user   => $my_username
    }

    mac_admin::osx_defaults { 'short delay for password dialog on screensaver':
        ensure => present,
        domain => 'com.apple.screensaver',
        key    => 'askForPasswordDelay',
        value  => '5',
        type   => 'float',
        user   => $my_username
    }

    class { 'grahamconfig::config::system': } ->
    class { 'grahamconfig::config::autopkg': } ->
    class { 'grahamconfig::config::atom': } ->
    class { 'grahamconfig::config::cocoapython': } ->
    class { 'grahamconfig::config::the_luggage': } ->
    class { 'grahamconfig::config::sublime_text': } ->
    class { 'grahamconfig::config::textmate': } ->
    class { 'grahamconfig::config::zsh': } ->
    class { 'grahamconfig::config::alfred': } ->
    class { 'grahamconfig::config::iterm': }
    class { 'grahamconfig::config::colors': }

    # If on Home Machine, enroll in Systems manager
    # if $::fqdn == 'Artoo.local'{
#         mac_profiles_handler::manage { 'com.meraki.sm.mdm':
#             ensure      => present,
#             file_source => "${my_homedir}/Dropbox/Config/Meraki/com.meraki.sm.mdm.mobileconfig",
#         }
#     }








    # mac_admin::osx_defaults { 'Remove Alfred Hat from the Menu Bar':
    #     domain  => "/Users/${my_username}/Library/Application Support/Alfred 2/Alfred.alfredpreferences/preferences/appearance/options/prefs.plist",
    #     key     => 'hidemenu',
    #     value   => 'true',
    #     type    => bool,
    #     user    => $my_username,
    # }






    ##hide away from meraki
    if !defined(File['/etc/meraki']){
        file { '/etc/meraki':
            ensure  =>  directory,
        }
    }

    file {'/etc/meraki/ci.conf':
        ensure  => present,
        source  => 'puppet:///modules/grahamconfig/meraki/ci.conf',
        owner   => 0,
        group   => 0,
        mode    => '0644',
    }

    file {'/Applications/Kaleidoscope.app':
        ensure => directory
    }

    file {'/Applications/Kaleidoscope.app/Contents':
        ensure => directory
    }

    file {'/Applications/Kaleidoscope.app/Contents/Resources':
        ensure => directory
    }

    file {'/Applications/Kaleidoscope.app/Contents/Resources/bin':
        ensure => directory
    }

    file {'/Applications/Kaleidoscope.app/Contents/Resources/bin/ksdiff':
        ensure => present
    }

    file {'/usr/local/bin/ksdiff':
        owner   => 0,
        group   => 0,
        mode    => '0755',
        source  => '/Applications/Kaleidoscope.app/Contents/Resources/bin/ksdiff',
        require => File['/usr/local/bin'],
    }

    # Symlink in the Atom config
    file {"/Users/${::luser}/.atom":
        ensure => link,
        target => "/Users/${my_username}/Dropbox/Config/Atom",
    }



    #Sublime text
    file { "/Users/${my_username}/Library/Application Support/Sublime Text 2":
        ensure  => link,
        target  => "${my_homedir}/Dropbox/Apps/Sublime Text 2",
    }

    file { "/Users/${my_username}/Library/Application Support/Sublime Text 3":
        ensure  => directory,
    }

    file { "/Users/${my_username}/Library/Application Support/Sublime Text 3/Installed Packages":
        ensure  => link,
        target  => "${my_homedir}/Dropbox/Apps/Sublime Text 3/Installed Packages",
    }

    file { "/Users/${my_username}/Library/Application Support/Sublime Text 3/Packages":
        ensure  => link,
        target  => "${my_homedir}/Dropbox/Apps/Sublime Text 3/Packages",
    }

    # iStat Preferences
    file { "/Users/${my_username}/Library/Preferences/com.bjango.istatmenus.extras.plist":
        ensure  => link,
        target  => "${my_homedir}/Dropbox/Apps/iStat Menus/com.bjango.istatmenus.extras.plist"
    }

    # Bartender Preferences
    file { "/Users/${my_username}/Library/Preferences/com.surteesstudios.Bartender.plist":
        ensure  => link,
        target  => "${my_homedir}/Dropbox/Apps/Bartender/com.surteesstudios.Bartender.plist"
    }


    mac_admin::osx_defaults {'Activate Caffeine on launch':
        user   => $my_username,
        domain => 'com.lightheadsw.Caffeine.plist',
        key    => 'ActivateOnLaunch',
        value  => 'true',
        type   => 'bool',
    }

    mac_admin::osx_defaults {'Disable shadow on screenshots':
        user   => $my_username,
        domain => 'com.apple.screencapture',
        key    => 'disable-shadow',
        value  => 'true',
        type   => 'bool',
    }

    mac_admin::osx_defaults {'Suppress Caffeine launch message':
        user   => $my_username,
        domain => 'com.lightheadsw.Caffeine.plist',
        key    => 'SuppressLaunchMessage',
        value  => 'true',
        type   => 'bool',
    }

    mac_admin::osx_defaults { 'hide users with a UID less than 500':
        domain => 'com.apple.loginwindow',
        key    => 'Hide500Users',
        type   => 'bool',
        value  => 'true',
    }
}
