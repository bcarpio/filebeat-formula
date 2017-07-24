{% set p    = salt['pillar.get']('filebeat', {}) %}
{% set g    = salt['grains.get']('filebeat', {}) %}

{%- set filebeat = {} %}
{%- do filebeat.update( {
  'username' : p.get('username', 'elastic'),
  'password' : p.get('password', 'changeme'),
}) %}
