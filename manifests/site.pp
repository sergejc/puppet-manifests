Exec { path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin', '/usr/local/bin'] }

class{'linux':}
class{'php':}
class{'apache':}
class{'mysql':}
class{'java':}
class{'nodejs':}
class{'google-chrome':}
class{'mongo-db':}
class{'selenium':}

class{'vhost':
    vhost => 'nelson.dev',
    documentroot => 'site'
}


Class['linux'] ->
    Class['java'] -> 
    Class['php'] ->
    Class['apache'] ->
    Class['vhost'] ->
    Class['mysql'] ->
    Class['google-chrome'] ->
    Class['mongo-db'] ->
    Class['selenium'] ->
    Class['nodejs']
