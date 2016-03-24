class grahamconfig::repositories::mine (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    class {'grahamconfig::repositories::mine::luggage_local': }
    class {'grahamconfig::repositories::mine::puppet_run': }
}
