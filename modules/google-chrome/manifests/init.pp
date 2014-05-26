class google-chrome {

    apt::key { 'google-chrome-add-key':
        url => 'https://dl-ssl.google.com/linux/linux_signing_key.pub', 
    }

    apt::source { 'google-chrome-add-source':
        name => 'google-chrome.list',
        url => 'http://dl.google.com/linux/chrome/deb stable main',
        require => Apt::Key['google-chrome-add-key'],
    }
    
    package { 'google-chrome-stable':
        ensure => latest, 
        require => Apt::Source['google-chrome-add-source'],
    }  
}
                                
