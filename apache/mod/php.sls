{% from "apache/mod/php-map.jinja" import pkgs with context %}

include:
  - apache.install

libapache2-mod-php:
  pkg.installed:
    - name: {{ pkgs['libapache2-mod-php'] }}
