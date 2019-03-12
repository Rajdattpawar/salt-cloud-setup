include:
  - apache.install

/etc/apache2/sites-available/example.conf:
  file.managed:
    - source: salt://apache/vhost/files/example.conf
    - user: root
    - group: root
    - mode: 0644
    - listen_in:
      - service: apache2

/etc/apache2/sites-enabled/example.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/example.conf
    - force: True
    - listen_in:
      - service: apache2
