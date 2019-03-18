{% from "php/module/map.jinja" import lookup with context %}

include:
  - apache.install
  - php

/usr/local/lib/php/extensions/excel.so:
  file.managed:
    - source: salt://php/module/files/extensions/{{ lookup['excel.so'] }}
    - makedirs: True
    - mode: 0644
    - listen_in:
      - service: apache2

/usr/local/lib/libxl-3.7.2.0/libxl.so:
  file.managed:
    - source: salt://php/module/files/extensions/{{ lookup['libxl.so'] }}
    - mode: 0644
    - makedirs: True
    - listen_in:
      - service: apache2

#https://github.com/iliaal/php_excel/issues/68
/usr/lib/libxl.so:
  file.symlink:
    - target: /usr/local/lib/libxl-3.7.2.0/libxl.so

/etc/php/7.0/mods-available/excel.ini:
  file.managed:
    - source: salt://php/module/files/extensions/excel.ini
    - mode: 0644
    - listen_in:
      - service: apache2

/etc/php/7.0/apache2/conf.d/20-excel.ini:
  file.symlink:
    - target: /etc/php/7.0/mods-available/excel.ini
    - listen_in:
      - service: apache2

/etc/php/7.0/cli/conf.d/20-excel.ini:
  file.symlink:
    - target: /etc/php/7.0/mods-available/excel.ini
