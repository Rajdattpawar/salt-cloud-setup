include:
  - apache.install
  - .install

/etc/php/7.0/apache2:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True

/etc/php/7.0/apache2/php.ini:
  file:
    - managed
    - source: salt://php/files/php-apache.ini
    - template: jinja
