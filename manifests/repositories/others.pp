class grahamconfig::repositories::others (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    class {'grahamconfig::repositories::others::the_luggage': }
}
