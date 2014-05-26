define apt::key ($url) {
    
    exec { "add-key-${$url}":
        command => "wget -q -O - ${url} | /usr/bin/apt-key add -",
    }
}   
