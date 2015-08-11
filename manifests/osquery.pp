class grahamconfig::osquery (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    file {'/var/osquery':
        ensure => directory,
    }

    file {'/var/osquery/osquery.conf.d/':
        ensure => directory,
    }

    file {'/var/osquery/osquery.conf':
        ensure => present,
        source => 'puppet:///modules/grahamconfig/osquery/osquery.conf',
        mode   => 0644,
    }

    file {'/Library/LaunchDaemons/com.facebook.osquery.osqueryd.plist':
        ensure => present,
        source => 'puppet:///modules/grahamconfig/osquery/com.facebook.osquery.osqueryd.plist',
        mode   => 0644,
    }

    file {'/etc/newsyslog.d/com.facebook.osquery.osqueryd.conf':
        ensure => present,
        source => 'puppet:///modules/grahamconfig/osquery/com.facebook.osquery.osqueryd.conf',
        mode   => 0644,
    }
    
}
