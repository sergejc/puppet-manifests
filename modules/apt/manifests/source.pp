define apt::source ($name, $url) {
    
    file { "add-source-${name}":
        path => "/etc/apt/sources.list.d/${name}",
        content => "deb ${url}",
        before => Exec["source-update-${name}"],
    }

    exec { "source-update-${name}":
        command => template('apt/single_repo_update.erb'),
    }
}
    
    
