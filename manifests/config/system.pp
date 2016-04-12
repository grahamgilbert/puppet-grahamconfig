class grahamconfig::config::system (
    ){

    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username
    
    if $my_username == 'grahamgilbert' {
    # Follow HTTP redirects with munki
    mac_admin::osx_defaults { 'Follow HTTP redirects with munki':
        ensure => present,
        domain => '/Library/Preferences/ManagedInstalls',
        key    => 'FollowHTTPRedirects',
        value  => 'https',
    }
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

    mac_admin::osx_defaults { 'Show hidden files in the Finder':
        ensure => present,
        domain => 'com.apple.Finder',
        key    => 'AppleShowAllFiles',
        value  => 'NO',
        user   => $my_username
    }

    mac_admin::osx_defaults { 'Disable Dashboard completely':
        ensure => present,
        domain => 'com.apple.dashboard',
        key    => 'mcx-disabled',
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

        mac_admin::osx_defaults { 'Finder Status Bar':
        ensure =>  present,
        domain =>  'com.apple.finder',
        key    =>  'ShowStatusBar',
        value  =>  'YES',
        user   => $my_username,
    }

    mac_admin::osx_defaults { 'Disable the "Are you sure you want to open this application?" dialog':
        key    => 'LSQuarantine',
        domain => 'com.apple.LaunchServices',
        value  => 'true',
        user    => $my_username,
    }

    mac_admin::osx_defaults {
        'Prevent Time Machine from prompting to use new hard drives as backup volume':
        ensure => present,
        key    => 'DoNotOfferNewDisksForBackup',
        domain => 'com.apple.TimeMachine',
        value  => 'true',
        type   => 'bool',
        user   => $my_username,
    }

    mac_admin::osx_defaults { 'Show time connected in the VPN menubar item':
        domain => 'com.apple.networkConnect',
        key    => 'VPNShowTime',
        type   => 'bool',
        value  => 'true',
        user    => $my_username,
    }

    mac_admin::osx_defaults { 'Disk util debug menu':
        domain  => 'com.apple.DiskUtility',
        key     => 'DUDebugMenuEnabled',
        value   => 1,
        user    => $my_username,
    }

    mac_admin::osx_defaults {'Four finger trackpad swipe':
        domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        key    => 'TrackpadFourFingerVertSwipeGesture',
        value  => 2,
        user   => $my_username,
    }

    mac_admin::osx_defaults { 'Set the button mode for multitouch mice':
        user   => $my_username,
        domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
        key    => 'MouseButtonMode',
        value  => 'TwoButton',
        type   => 'string',
    }

    mac_admin::osx_defaults { 'Set the trackpad tap to click':
        user   => $my_username,
        domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        key    => 'Clicking',
        value  => 'true',
    }

    mac_admin::osx_defaults { 'Open finder windows at home directory':
        user   => $my_username,
        domain => 'com.apple.finder',
        key    => 'NewWindowTargetPath',
        value  => $my_homedir,
    }

    mac_admin::osx_defaults { 'Expand save panel by default':
        user   => $my_username,
        key    => 'NSNavPanelExpandedStateForSaveMode',
        domain => 'NSGlobalDomain',
        value  => true;
    }

    # Disable GateKeeper
    exec { 'Disable Gatekeeper':
        command => '/usr/sbin/spctl --master-disable',
        unless  => '/usr/sbin/spctl --status | grep disabled',
    }
}
