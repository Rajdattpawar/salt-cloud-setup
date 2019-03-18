include:
  - apache.install

ssl:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2
