{% from "php/module/map.jinja" import lookup with context %}

include:
  - apache.install
  - php

/usr/local/lib/php/extensions/esl.so:
  file.managed:
    - source: salt://php/module/files/extensions/{{ lookup['esl.so'] }}
    - makedirs: True
    - mode: 0644
    - listen_in:
      - service: apache2

/etc/php/7.0/mods-available/esl.ini:
  file.managed:
    - source: salt://php/module/files/extensions/esl.ini
    - mode: 0644
    - listen_in:
      - service: apache2

/etc/php/7.0/apache2/conf.d/20-esl.ini:
  file.symlink:
    - target: /etc/php/7.0/mods-available/esl.ini
    - listen_in:
      - service: apache2

/etc/php/7.0/cli/conf.d/20-esl.ini:
  file.symlink:
    - target: /etc/php/7.0/mods-available/esl.ini
