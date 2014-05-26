class java {

    $path = "shared/accepted-oracle-license-v1-1"

    apt::ppa { 'java-add-repo':
        ppa => 'ppa:webupd8team/java',        
    }    

    exec { 'java-license':
        command => "echo debconf ${path} select true | debconf-set-selections;
                    echo debconf ${path} seen true   | debconf-set-selections;",
        require => Apt::Ppa['java-add-repo']
    }

    package { 'oracle-java8-installer':
        ensure => 'latest',
        require => Exec['java-license'] 
    }
}
