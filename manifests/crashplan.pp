class grahamconfig::crashplan (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    # file {'/Library/LaunchDaemons/com.crashplan.engine.plist':
    #     ensure => 'present',
    #     mode   => '644',
    #     owner  => 0,
    #     group  => 0,
    #     source => 'puppet:///modules/grahamconfig/crashplan/com.crashplan.engine.plist'
    # }
}
