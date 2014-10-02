class nodejs {

    $packages = [
        'grunt-cli', 'bower', 'jade',
        'coffee-script', 'express', 'jasmine-node',
        'mocha', 'yo', 'browserify',
        'beefy', 'gulp', 'react-tools',
        'lodash', 'generator-polymer', 'chai',
        'webdriverjs', 'phantomjs', 'grunt-init',
        'http-server', 'phantom-jasmine', 'mocha-phantomjs',
        'selenium-webdriver', 'casperjs'
    ]

    apt::ppa { 'add-node-repo':
        ppa => 'ppa:chris-lea/node.js',
    }

    package { 'nodejs':
        ensure => 'latest',
        require => Apt::Ppa['add-node-repo'],
    }

    file { '/usr/bin/node':
        ensure => 'link',
        target => '/usr/bin/nodejs',
        require => Package['nodejs']
    }

   package { $packages:
        ensure => present,
        provider => 'npm',
        require => File['/usr/bin/node'],
    }
}
