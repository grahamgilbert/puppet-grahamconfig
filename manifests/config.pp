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

    osx_chsh { $my_username:
        shell   => '/bin/zsh',
    }

    class { 'grahamconfig::config::system': } ->
    class {'grahamconfig::config::autopkg': }

    # If on Home Machine, enroll in Systems manager
    # if $::fqdn == 'Artoo.local'{
#         mac_profiles_handler::manage { 'com.meraki.sm.mdm':
#             ensure      => present,
#             file_source => "${my_homedir}/Dropbox/Config/Meraki/com.meraki.sm.mdm.mobileconfig",
#         }
#     }



    # CocoaPython Template for Xcode
    repository { 'Xcode4CocoaPythonTemplates':
        source => 'gregneagle/Xcode4CocoaPythonTemplates',
        path   => "${my_sourcedir}/Others/Xcode4CocoaPythonTemplates",
    }

    file { "/Users/${my_username}/Library/Developer/Xcode/Templates":
        ensure  => link,
        target  => "${my_sourcedir}/Others/Xcode4CocoaPythonTemplates",
        require => Repository['Xcode4CocoaPythonTemplates']
    }

    exec {'Install the luggage':
        command => '/usr/bin/make bootstrap_files',
        cwd     => "${my_sourcedir}/Others/luggage",
        creates => '/usr/local/share/luggage/luggage.make',
        require => Repository['the_luggage']
    }

    file { '/usr/local/share/luggage/luggage.local':
        ensure  => link,
        target  => "${my_sourcedir}/Mine/luggage_local/luggage.local",
        require => Exec['Install the luggage']
    }

    # TextMate

    repository { 'puppet-textmate-bundle':
        source  => 'puppet-textmate-bundle/puppet-textmate-bundle',
        path    => "${my_sourcedir}/Others/puppet-textmate-bundle",
    }


    file { "/Users/${my_username}/Library/Application Support/TextMate/Managed/Bundles/Puppet.tmbundle":
        ensure  => link,
        force   => true,
        target  => "${my_sourcedir}/Others/puppet-textmate-bundle",
        require => Repository['puppet-textmate-bundle']
    }

    mac_admin::osx_defaults { 'TextMate File Browser Placement':
        ensure => present,
        domain => 'com.macromates.TextMate.preview',
        key    => 'fileBrowserPlacement',
        value  => 'left',
    }

    repository { 'oh-my-zsh':
        source => 'grahamgilbert/oh-my-zsh',
        path   => "/Users/${my_username}/.oh-my-zsh",
        ensure => 'cbabe35ea03432046f03657a8dbde5f46634668d',
     }

     file {"/Users/${my_username}/.oh-my-zsh":
        owner   => $my_username,
        recurse => true,
        require => Repository['oh-my-zsh'],
    }

    file { "/Users/${my_username}/.zshrc":
        ensure  => link,
        target  => "/Users/${my_username}/.oh-my-zsh/grahams-zshrc",
        require => Repository['oh-my-zsh'],
        owner   => $my_username,
    }



    # mac_admin::osx_defaults { 'Remove Alfred Hat from the Menu Bar':
    #     domain  => "/Users/${my_username}/Library/Application Support/Alfred 2/Alfred.alfredpreferences/preferences/appearance/options/prefs.plist",
    #     key     => 'hidemenu',
    #     value   => 'true',
    #     type    => bool,
    #     user    => $my_username,
    # }

    mac_admin::osx_defaults { 'Set Alfred theme to Lion':
        domain  => 'com.runningwithcrayons.Alfred-Preferences',
        key     => 'appearance.theme',
        value   => 'alfred.theme.lion',
        user    => $my_username,
    }

   
    

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
