class vhost($vhost, $documentroot) {

    exec { 'root-folder':
        command => "mkdir -p /vagrant/html",
        creates => '/vagrant/html'
    }

    exec { 'site-folder':
        command => "mkdir -p /vagrant/${vhost}/${documentroot}",
        creates => "/vagrant/${vhost}/${documentroot}",
    }
    
    exec {'document-root':
        command => 'rm -rf /var/www && ln -fs /vagrant /var/www',
        require => [Class['apache'], Exec['site-folder']]
    }

    file { 'vhost':
        path    => "/etc/apache2/sites-available/${vhost}.conf",
        content => template('vhost/vhost.erb'),
    }

    exec { 'site-enable':
        command => "a2ensite $vhost.conf",
        require => File['vhost'],
        notify => Exec['force-apache-reload']
    }

    exec {'force-apache-reload':
        command => 'service apache2 reload',        
    }
   
    exec { 'hosts':
        command => "echo '127.0.0.1\t${vhost}' >> /etc/hosts"    
    }
}
