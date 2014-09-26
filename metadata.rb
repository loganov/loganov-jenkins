name             'loganov-jenkins'
maintainer       'Loganov Industries'
maintainer_email 'devops@loganov.com'
license          'All rights reserved'
description      'Installs/Configures loganov-jenkins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.7'

depends          'loganov-java'
depends          'jenkins'
depends          'loganov-vagrant'
depends          'packagecloud'
depends          'yumgroup'
