update-hostname:
  salt.state:
    - tgt: '*'
    - sls:
      - hostname

saltutil.sync_all:
  salt.function:
    - tgt: '*'
    - reload_modules: True

mine.update:
  salt.function:
    - tgt: '*'

highstate_run:
  salt.state:
    - tgt: '*'
    - highstate: True
