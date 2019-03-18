include:
  - apache.install

rewrite:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2
