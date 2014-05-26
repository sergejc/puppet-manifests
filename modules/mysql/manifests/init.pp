class mysql {    
    
    package { 'mysql-server':
        name => 'mysql-server',
        ensure => 'latest',
    }

    exec { 'utf-8':
        command => 'sed -i "/\[mysqld\]/a character-set-server = utf8"  /etc/mysql/my.cnf',
        require => Package['mysql-server'],
        notify => Service['mysql']
    }
    
    service { 'mysql':
        ensure => 'running',
        hasrestart => true,
    }
} 
