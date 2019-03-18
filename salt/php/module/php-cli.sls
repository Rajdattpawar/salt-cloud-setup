{% set package_table = {
    '14.04': {'php': 'php5'},
    '16.04': {'php': 'php'},
} %}

{% if salt['grains.get']('os') == 'Ubuntu' %}
    {% if grains['lsb_distrib_release'] in package_table %}
        {% set pkgs = package_table[grains['lsb_distrib_release']] %}
    {% else %}
        {% set pkgs = {'php': 'php'} %}
    {% endif %}
{% else %}
    {% set pkgs = {'php': 'php'} %}
{% endif %}

{{ pkgs['php'] }}-cli:
  pkg:
    - installed
