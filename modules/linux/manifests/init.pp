class linux {    

    $packages = [
        'git', 'subversion', 'htop',
        'zsh', 'vim', 'mc',
        'xvfb', 'unzip', 'curl',
        'build-essential', 
        'software-properties-common',
        'xclip', 'tree', 'wget', 'memcached',
        'apache2-utils'
    ]

    package { $packages:
        ensure => 'latest',
    }
} 
