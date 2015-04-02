class grahamconfig::config::sublime_text (
    ){

    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    file {"${my_homedir}/.atom":
      ensure => 'link';
      target => "${my_homedir}/Dropbox/Config/Atom"
    }

    file {'/usr/local/bin/atom':
        ensure => 'link',
        target => '/Applications/Atom.app/Contents/MacOS/Atom',
    }

}
