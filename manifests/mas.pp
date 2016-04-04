class grahamconfig::mas {

    include mas

    package { 'Tweetbot':
        ensure   => 'present',
        provider => 'mas',
    }
}
