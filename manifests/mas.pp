class grahamconfig::mas {
    package { 'Dash':
        ensure   => present,
        provider => mas,
    }
}
