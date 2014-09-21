class linux {    

    $packages = [
        'git-core', 'subversion', 'htop',
        'zsh', 'vim', 'mc',
        'xvfb', 'unzip', 'curl',
        'build-essential', 
        'software-properties-common',
<<<<<<< HEAD
        'xclip', 'tree', 'wget', 'memcached',
        'apache2-utils'
=======
        'xclip', 'tree', 'wget', 'memcached'
>>>>>>> 0ae8fdd5e8876d50f0f2f04ce22f0aa3ba0772e4

    ]

    package { $packages:
        ensure => 'latest',
    }
} 
