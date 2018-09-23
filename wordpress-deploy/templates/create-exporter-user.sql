CREATE USER IF NOT EXISTS  {{ db_exporter_user }} IDENTIFIED BY '{{ db_exporter_password }}';
GRANT PROCESS, REPLICATION CLIENT ON *.* TO {{ db_exporter_user }};
GRANT SELECT ON performance_schema.* TO {{ db_exporter_user }};
GRANT SELECT ON {{ db_name }}.* TO {{ db_exporter_user }};
