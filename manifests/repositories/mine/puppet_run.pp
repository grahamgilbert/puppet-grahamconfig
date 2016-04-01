class grahamconfig::repositories::mine::puppet_run {
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    # repository { 'puppet_run':
    #     path    =>  "${my_sourcedir}/Mine/puppet_run",
    #     source  =>  'grahamgilbert/puppet_run',
    # }
    #
    # file {"$my_sourcedir/Mine/puppet_run":
    #     owner   => $my_username,
    #     recurse => true,
    #     require => Repository['puppet_run']
    # }

}
