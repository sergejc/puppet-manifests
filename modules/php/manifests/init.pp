class php {

    $module = 'php'

    $cli_php_path = '/etc/php5/cli/php.ini'
    $apache_php_path = '/etc/php5/apache2/php.ini'    
    
    $packagelist = [
        'php5', 'php5-cli', 'php5-curl',
        'php5-gd', 'php5-json', 'php5-mysql',
        'php5-readline', 'php5-sqlite', 'php5-mcrypt',
        'php5-memcached', 'php5-mongo', 'php5-mysqlnd',
        'php5-dev', 'php5-xsl', 'php5-pgsql', 
        'php5-imap', 'php5-imagick', 'php5-redis',
        'php5-svn', 'php5-xsl'
        ]

    package { $packagelist:
        ensure => 'latest',
    }

    exec { 'php-ini-cli':
        command => template("${module}/php_cli.erb"), 
        require => Package['php5'],
    }
    
    exec { 'php-ini-apache':
        command => template("${module}/php_apache.erb"), 
        require => Package['php5'],
    }    

    exec { 'composer-init':
        command => template("${module}/composer.erb"),
        require => Package['php5'],
    }

    exec { 'xdebug-install':
        command => 'pecl install xdebug',
        creates => '/usr/lib/php5/20121212/xdebug.so',
        require => [Package['php5'], Package['php5-dev']],
    }

    exec { 'xdebug-cli':
        command => template("${module}/php_xdebug_cli.erb"),
        require => Package['php5-cli'],
    }

    exec { 'xdebug-apache':
        command => template("${module}/php_xdebug_apache.erb"),
        require => Package['php5'],
    }

    exec { 'phpunit-install':
        command => template("${module}/phpunit.erb"),        
        require => Package['php5'],
    }

    exec { 'codeseption-install':
        command => template("${module}/codeception.erb"),
        require => Package['php5'],
    }

    file { "/usr/local/bin/codecept":
        ensure => present,
        mode => 755,
        require => Exec['codeseption-install'],
    }


    exec { 'phpunit-bashrc':
        command => 'echo "alias phpunit=\"phpunit --colors\"" >> .bashrc',
    }

    exec { 'selenium-sownload':
        command => template("${module}/selenium.erb")
    }    
}
