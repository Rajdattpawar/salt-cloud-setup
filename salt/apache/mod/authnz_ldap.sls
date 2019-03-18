include:
  - apache.install

authnz_ldap:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2
