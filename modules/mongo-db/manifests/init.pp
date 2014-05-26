class mongo-db {

    apt::serverkey {'mongo-add-serverkey':
        id => '7F0CEB10',
    }

    apt::source { 'mongo-add-source':
        name => '10gen.list',
        url => 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen',
        require => Apt::Serverkey['mongo-add-serverkey']
    }
  
    package { 'mongodb-org':
        ensure => 'latest',
        require => Apt::Source['mongo-add-source']
    }
}
