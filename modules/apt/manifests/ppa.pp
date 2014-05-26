define apt::ppa($ppa) {

    exec { "add-ppa-${ppa}":
        command => "add-apt-repository $ppa",
        require => Package['software-properties-common'],
        before => Exec["update-ppa-${ppa}"],
    }

    exec { "update-ppa-${ppa}":
        command => 'apt-get update -y',
    }

}
