include:
  - apache.install

libapache2-mod-svn:
  pkg.installed:
    -

dav_svn:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2

authz_svn:
  apache_module:
    - enabled
    - listen_in:
      - service: apache2
