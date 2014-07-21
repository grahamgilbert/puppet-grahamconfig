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

    # Stop Preview re-opening documents
    mac_admin::osx_defaults { 'Stop Preview re-opening documents':
        ensure => present,
        domain => 'com.apple.Preview',
        key    => 'NSQuitAlwaysKeepsWindows',
        value  => 'NO',
    }

    mac_admin::osx_defaults { 'Enable AirDrop on all interfaces':
        ensure => present,
        domain => 'com.apple.NetworkBrowser',
        key    => 'BrowseAllInterfaces',
        value  => 'true',
        type   => 'bool',
        user   => $my_username
    }

    mac_admin::osx_defaults { 'Copy text from QuickLook':
        ensure => present,
        domain => 'com.apple.finder',
        key    => 'QLEnableTextSelection',
        value  => 'YES',
    }

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

    file { "/Users/${my_username}/.zshrc":
        ensure  => link,
        target  => "/Users/${my_username}/.oh-my-zsh/grahams-zshrc",
        require => Repository['oh-my-zsh']
    }

    mac_admin::osx_defaults { 'Finder Status Bar':
        ensure =>  present,
        domain =>  'com.apple.finder',
        key    =>  'ShowStatusBar',
        value  =>  'YES',
    }

    mac_admin::osx_defaults { 'Disable the "Are you sure you want to open this application?" dialog':
        key    => 'LSQuarantine',
        domain => 'com.apple.LaunchServices',
        value  => 'true',
    }

    mac_admin::osx_defaults { 'Remove Alfred Hat from the Menu Bar':
        domain  => 'com.alfredapp.Alfred',
        key     => 'appearance.hideStatusBarIcon',
        value   => 'YES',
    }

    mac_admin::osx_defaults {
        'Prevent Time Machine from prompting to use new hard drives as backup volume':
        ensure => present,
        key    => 'DoNotOfferNewDisksForBackup',
        domain => 'com.apple.TimeMachine',
        value  => 'true',
        type   => 'bool',
    }

    mac_admin::osx_defaults { 'Make Go2Shell Use iTerm':
        domain  => 'com.alice.mac.go2shell',
        key     => 'usingTerminal',
        #type   => 'BOOL',
        value   => '2',
    }

    mac_admin::osx_defaults { 'Show time connected in the VPN menubar item':
        domain => 'com.apple.networkConnect',
        key    => 'VPNShowTime',
        type   => 'bool',
        value  => 'true',
    }

    mac_admin::osx_defaults { 'Disk util debug menu':
        domain  => 'com.apple.DiskUtility',
        key     => 'DUDebugMenuEnabled',
        value   => 1,
    }

    mac_admin::osx_defaults {'Four finger trackpad swipe':
        domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        key    => 'TrackpadFourFingerVertSwipeGesture',
        value  => 2,
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

# Install the ksdiff tool

    file {'/usr/local':
        ensure => 'directory',
        owner  => 0,
        group  => 0,
    }

    file {'/usr/local/bin':
        ensure => 'directory',
        owner  => 0,
        group  => 0,
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
    }

    mac_admin::osx_defaults { 'Load iTerm prefences from Dropbox':
        domain => 'com.googlecode.iterm2',
        key    => 'PrefsCustomFolder',
        value  => '~/Dropbox/Apps/iTerm',
    }

    mac_admin::osx_defaults {'Always sync local iTerm preferences to Dropbox':
        domain => 'com.googlecode.iterm2',
        key     => 'NoSyncNeverRemindPrefsChangesCopy',
        type     => 'bool',
        value  => 'true',
    }
    #Sublime text
    file { "/Users/${my_username}/Library/Application Support/Sublime Text 2":
        ensure  => link,
        target  => "${my_homedir}/Dropbox/Apps/Sublime Text 2",
        require => Repository['Xcode4CocoaPythonTemplates']
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
}