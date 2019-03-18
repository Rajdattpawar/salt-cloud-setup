include:
  - apache.install

proxy:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2

proxy_http:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2
