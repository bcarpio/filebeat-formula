{%- from 'filebeat/settings.sls' import filebeat with context %}

include:
  - elasticyumrepo

filebeat:
  pkg.installed:
    - pkgs:
      - filebeat

filebeat-yml:
  file.managed:
    - name: /etc/filebeat/filebeat.yml
    - source: salt://filebeat/files/filebeat.yml
    - template: jinja
    - context:
      username: {{ filebeat.username }}
      password: {{ filebeat.password }}

filebeat-service:
  service.running:
    - name: filebeat
    - enable: True
    - watch:
      - file: filebeat-yml
