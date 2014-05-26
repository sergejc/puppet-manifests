define apt::serverkey ($id) {
    
    exec { "add-server-key-${$id}":
        command => "apt-key adv --keyserver keyserver.ubuntu.com --recv  ${id}",
    }
}   

