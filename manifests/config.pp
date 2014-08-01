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

    #include managedmac::security

    class { 'grahamconfig::config::system': } ->
    class { 'grahamconfig::config::autopkg': } ->
    class { 'grahamconfig::config::cocoapython': } ->
    class { 'grahamconfig::config::the_luggage': } ->
    class { 'grahamconfig::config::textmate': } ->
    class { 'grahamconfig::config::zsh': } ->
    class { 'grahamconfig::config::alfred': } ->
    class { 'grahamconfig::config::iterm': }

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
