class grahamconfig::mas {

    include mas

    package { 'Dash':
        ensure   => 'present',
        provider => 'mas',
    }
}
