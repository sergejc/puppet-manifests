class selenium {

    $module = 'selenium'
    
    $server = 'selenium-server-standalone-2.41.0.jar'
    $server_version = '2.41'

    $driver_version = '2.10'
    
    exec { 'chrome-driver-download':
        command => template("${module}/driver_download.erb"),
        creates => '/usr/local/bin/chromedriver',
    }

    exec { 'selenium-download':
        command => template("${module}/server.erb"),
        creates => "/usr/local/bin/${server}",
    }
    
    exec { 'create-alias':
        command => template("${module}/alias.erb"), 
    }
} 
