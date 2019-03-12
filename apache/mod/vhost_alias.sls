include:
  - apache.install

vhost_alias:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2
