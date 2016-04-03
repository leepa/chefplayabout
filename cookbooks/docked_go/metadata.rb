name             'docked_go'
maintainer       'Lee Packham'
maintainer_email 'lpackham@gmail.com'
license          'All rights reserved'
description      'Installs/Configures docked_go'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'docker', '~> 2.6.2'
depends 'firewall', '~> 2.5.0'
