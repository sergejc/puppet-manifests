class apt::update {

    exec {'update':
        command => 'apt-get update',
        refreshonly => true,
        logoutput   => 'on_failure',
        timeout => 10,
    }
}
