class linux {    

    $packages = [
        'git-core', 'subversion', 'htop',
        'zsh', 'vim', 'mc',
        'xvfb', 'unzip', 'curl',
        'build-essential', 
        'software-properties-common',
        'xclip', 'tree', 'wget', 'memcached'

    ]

    package { $packages:
        ensure => 'latest',
    }
} 
