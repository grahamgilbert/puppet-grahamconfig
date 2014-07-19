class grahamconfig::config (
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
        require => File["${my_sourcedir}/Others"],
    }

    file { "/Users/${my_username}/Library/Developer/Xcode/Templates":
        ensure  => link,
        target  => "${my_sourcedir}/Others/Xcode4CocoaPythonTemplates",
        require => Repository['Xcode4CocoaPythonTemplates']
    }
}