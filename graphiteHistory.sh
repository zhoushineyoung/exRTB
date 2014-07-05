apt-get update
 apt-get install graphite-carbon
apt-get install graphite-carbon graphite-web whisper
    6  apt-get install graphite-carbon graphite-web graphite-whisper
    7  apt-get install graphite-carbon graphite-web python-whisper
    8  apt-get install apache2 apache2-mpm-worker libapache2-mod-wsgi
    9  echo "CARBON_CACHE_ENABLED=true" > /etc/default/graphite-carbon
   10  service carbon-cache start
   11  cp /usr/share/graphite-web/apache2-graphite.conf /etc/apache2/sites-enabled/graphite.conf
   12  sudo a2dissite 000-default
   13  service apache2 restart
   14  graphite-manage syncdb
