# Ansible Apache Envvars
Ansible Role for Apache envvars file


(Debian/Ubuntu ONLY) You can edit the enviroment variables in `envvars`, to do that you must change `apache_create_envvars` to true, so the task run. 
The following Variables (and the default value) are currently available:
    
    apache_envvars_multiple_instances_suffix: "-${APACHE_CONFDIR##/etc/apache2-}"
    apache_envvars_run_user: www-data
    apache_envvars_run_group: www-data
    apache_envvars_pid_file: /var/run/apache2/apache2$SUFFIX.pid
    apache_envvars_run_dir: /var/run/apache2$SUFFIX
    apache_envvars_lock_dir: /var/lock/apache2$SUFFIX
    apache_envvars_log_dir: /var/log/apache2$SUFFIX

`APACHE_LYNX`, `APACHE_ULIMIT_MAX_FILES`, `APACHE_ARGUMENTS`, `APACHE2_MAINTSCRIPT_DEBUG` need to be activated before the value is added to the file.
    
    apache_envvars_lynx_enable: false
    apache_envvars_lynx: 'www-browser -dump'
    apache_envvars_ulimit_enable: false
    apache_envvars_ulimit: 'ulimit -n 65536'
    apache_envvars_arguments_enable: false
    apache_envvars_arguments: ""
    apache_envvars_maintscript_debug_enable: false
    apache_envvars_maintscript_debug: 1

the default values are stored in `vars/Debian.yml`