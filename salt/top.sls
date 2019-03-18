base:
  'role:web':
    - match: grain
    - apache
    - php
    - code
  'role:rabbitmq':
    - match: grain
    - rabbitmq
