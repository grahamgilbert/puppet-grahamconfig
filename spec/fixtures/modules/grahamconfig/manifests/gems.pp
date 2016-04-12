class grahamconfig::gems {
    
    package { 'bundler':
        ensure   => 'latest',
        provider => 'gem',
    }

    package { 'CFPropertyList':
        ensure   => 'latest',
        provider => 'gem',
    }
    
    package { 'puppet-lint':
        ensure   => 'latest',
        provider => 'gem',
    }

    package { 'librarian-puppet':
        ensure   => 'latest',
        provider => 'gem',
    }
    
    package { 'rspec-puppet':
        ensure   => 'latest',
        provider => 'gem',
    }

    package { 'puppetlabs_spec_helper':
        ensure   => 'latest',
        provider => 'gem',
    }
    
}