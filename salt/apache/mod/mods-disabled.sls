include:
  - apache.install

{% set disabled_mod= ['access_compat',]%}
{% for name in disabled_mod %}
{{name}}_disabled:
  apache_module.disabled:
    - name: {{name}}
    - listen_in:
      - service: apache2
{% endfor %}
