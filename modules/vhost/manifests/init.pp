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
<<<<<<< HEAD
        content => template('vhost/vhost.erb'),
=======
        content => template('site-config/vhost.erb'),
>>>>>>> 0ae8fdd5e8876d50f0f2f04ce22f0aa3ba0772e4
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
