/var/www/html/Example:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
/var/www/html/Example/index.php:
  file:
    - managed
    - source: salt://code/files/Example/index.php
