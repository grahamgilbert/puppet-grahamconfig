class grahamconfig::mas {

    include mas

    package { 'Tweetbot':
        ensure   => '557168941',
        provider => 'mas',
    }
}
