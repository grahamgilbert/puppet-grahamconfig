class grahamconfig::config::sublime_text (
    ){

    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    file {'/usr/local/bin/subl':
        ensure => 'link',
        target => '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl',
    }

}