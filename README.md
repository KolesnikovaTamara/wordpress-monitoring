## Wordpress setup with monitoring
This is ansible playbook for setting up WordPress with monitoring.
# Getting started
To run this playbook you need install   [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) on your computer.


Go into reposiotory root directory and create a [hosts](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html) file to describe the host where you want to run  installation:
```yml
[wordpress]
<host_ip> ansible_connection=ssh ansible_user=<host_user> ansible_ssh_pass=<host_password>
```
Use this command to run a playbook against specified host:
```sh
ansible-playbook -i hosts --vault-password-file=<path_to_vault_file> \
-e user=<host_user>  wordpress-setup.yml
```
path_to_vault_file - file used to encrypt sensitive data

## About
The playbook consists of three roles, which also can be used separately:
* **docker-install** - a role for installing [Docker](https://www.docker.com/)
* **wordpress-deploy**  - a role for deploying  [WordPress](https://hub.docker.com/_/wordpress/) and [MySQL](https://hub.docker.com/_/mysql/) docker containers
* **monitoring-install** - a role for deploying Docker containers for  monitoring:
[Prometheus](https://github.com/prometheus/prometheus) for storage;  [Grafana](https://github.com/grafana/grafana)  for visualisation;
[cAdvisor](https://github.com/google/cadvisor),  [node_expopter](https://github.com/prometheus/node_exporter),  [apache_exporter](https://github.com/Lusitaniae/apache_exporter),  [mysql_exporter](https://github.com/prometheus/mysqld_exporter) for metrics collection.

After the installation,  you will have WordPress (port 80)
and Grafana (port 3000) running on the specified host.  By default
Grafana will have three monitoring dashboards:
* Docker and Host
* Apache
* MySQL
