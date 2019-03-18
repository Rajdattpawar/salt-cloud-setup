rabbitmq:
  user:
    admin:
      - password: admin123
      - tags: administrator
      - perms:
        - '/':
          - '.*'
          - '.*'
          - '.*'
        - '/payments':
          - '.*'
          - '.*'
          - '.*'
      - runas: root
  vhost:
      "/":
      "/payments":
