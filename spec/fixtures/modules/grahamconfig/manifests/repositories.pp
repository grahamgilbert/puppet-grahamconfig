class grahamconfig::repositories (
){
    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    # class {'grahamconfig::repositories::mine': }
    # class {'grahamconfig::repositories::others': }
}
