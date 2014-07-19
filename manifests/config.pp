class grahamconfig::config (
    ){

    $my_homedir   = $grahamconfig::my_homedir,
    $my_sourcedir = $grahamconfig::my_sourcedir,
    $my_username  = $grahamconfig::my_username
    
    if !defined(File["${my_sourcedir}/Mine"]){
        file {"${my_sourcedir}/Mine":
            ensure => directory,
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

    mac_admin::osx_defaults { 'Copy text from QuickLook':
        ensure => present,
        domain => 'com.apple.finder',
        key    => 'QLEnableTextSelection',
        value  => 'YES',
    }
}