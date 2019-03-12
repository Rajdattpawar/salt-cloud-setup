include:
  - apache.install

status:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2

/etc/apache2/mods-available/status.conf:
  file.managed:
    - source: salt://apache/files/mods-available/status.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - listen_in:
      - service: apache2

/etc/apache2/mods-enabled/status.conf:
  file.symlink:
    - target: /etc/apache2/mods-available/status.conf
    - force: True
    - listen_in:
      - service: apache2

