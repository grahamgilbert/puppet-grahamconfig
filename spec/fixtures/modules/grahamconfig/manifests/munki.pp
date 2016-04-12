class grahamconfig::munki (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    if !defined(File['/usr/local/munki']){
        file {'/usr/local/munki':
            ensure => directory,
        }
    }

    if !defined(File['/usr/local/munki/conditions']){
        file {'/usr/local/munki/conditions':
            ensure => directory,
        }
    }

    file {'/usr/local/munki/conditions/shard':
        owner  => root,
        group  => wheel,
        mode   => '0755',
        source => 'puppet:///modules/grahamconfig/munki/shard'
    }
}
