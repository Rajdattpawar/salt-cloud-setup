rabbitmq-server:
  pkg.installed:
    - name: rabbitmq-server
  service:
    - running
    - enable: True
    - require:
      - pkg: rabbitmq-server

rabbitmq_management:
  rabbitmq_plugin:
    - enabled
    - runas: root
    - watch_in:
      - service: rabbitmq-server

{% for name, policy in salt["pillar.get"]("rabbitmq:vhost", {}).iteritems() %}
rabbitmq_vhost_{{ name }}:
  rabbitmq_vhost.present:
    - name: {{ name }}
    - require:
      - service: rabbitmq-server
{% endfor %}
 
{% for name, user in salt["pillar.get"]("rabbitmq:user").iteritems() %}
rabbitmq_user_{{ name }}:
  rabbitmq_user.present:
    - name: {{ name }}
    {% for value in user %}
    - {{ value }}
    {% endfor %}
    - require:
      - service: rabbitmq-server
{% endfor %}
