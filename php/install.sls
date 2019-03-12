{% from "php/package-map.jinja" import pkgs with context %}
php:
  pkg.installed:
    - name: {{ pkgs['php'] }}
