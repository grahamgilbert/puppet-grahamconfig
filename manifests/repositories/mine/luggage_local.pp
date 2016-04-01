class grahamconfig::repositories::mine::luggage_local{
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    # repository { 'luggage_local':
    #     path    =>  "${my_sourcedir}/Mine/luggage_local",
    #     source  =>  'grahamgilbert/luggage_local',
    #     require => Repository['the_luggage']
    # }

}
