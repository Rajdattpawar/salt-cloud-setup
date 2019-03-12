remove-apache-order:
  file.replace:
    - name: /etc/apache2/mods-available/php5.conf
    - pattern: '^    Order Deny,Allow'
    - repl: '#    Order Deny,Allow'
    - listen_in:
      - service: apache2

replace-deny-from-all:
  file.replace:
    - name: /etc/apache2/mods-available/php5.conf
    - pattern: '[Dd]eny from all'
    - repl: 'Require all denied'
    - listen_in:
      - service: apache2
