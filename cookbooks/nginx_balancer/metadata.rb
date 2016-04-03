name             'nginx_balancer'
maintainer       'Lee Packham'
maintainer_email 'lpackham@gmail.com'
license          'All rights reserved'
description      'Installs/configures the nginx load balancer'
version          '0.1.0'

depends 'nginx', '~> 2.7.6'
depends 'firewall', '~> 2.5.0'
