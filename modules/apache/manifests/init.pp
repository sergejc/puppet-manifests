class apache {

    package { 'apache2':
        ensure => 'latest',
    }

    service { 'apache2':
        ensure => 'running',
        hasrestart => true,
        require => Package['apache2'],
    }

    exec { 'fqdn':
        command => "echo 'ServerName ${fqdn}' | tee /etc/apache2/conf-available/servername.conf",
        require => Package['apache2'],
    }

    exec { 'conf-apply':
        command => 'a2enconf servername',
        require => Exec['fqdn'],
        notify => Service[apache2]
    }

    exec { 'mode_rewrite':
        command => "a2enmod rewrite",
        unless => "readlink -e /etc/apache2/mods-enabled/rewrite.load",
        require => Package['apache2'],
        notify => Service[apache2]
    }
}
