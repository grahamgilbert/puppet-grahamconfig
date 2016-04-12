class grahamconfig::mas {

    include mas

    package { 'Tweetbot for Twitter':
        ensure   => 'installed',
        provider => 'mas',
    }
}
