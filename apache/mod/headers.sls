include:
  - apache.install

headers:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2
