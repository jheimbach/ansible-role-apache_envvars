#Ansible Apache Envvars

[![Build Status](https://travis-ci.org/JHeimbach/ansible-role-apache_envvars.svg?branch=master)](https://travis-ci.org/JHeimbach/ansible-role-apache_envvars)

Ansible Role to change Apache envvars under `/etc/apache2/envvars`

Requirements
------------

You must have apache2 installed, the role checks if apache2 is install, if apache2 is not installed the envvars aren't changed (in fact the task is not running).
I have no dependency package for installing apache, but I recommend [geerlingguy.apache](https://galaxy.ansible.com/detail#/role/428/), it should working with every other role. If not, please let me know.


Role Variables
--------------

Followong Variables are possible to set:

    # If you have more than one Apache Instance running/installed
    apache_envvars_multiple_instances_suffix: "-${APACHE_CONFDIR##/etc/apache2-}"

    # User which will run the Apache service
    apache_envvars_run_user: www-data
    apache_envvars_run_group: www-data

    apache_envvars_pid_file: /var/run/apache2/apache2$SUFFIX.pid
    apache_envvars_run_dir: /var/run/apache2$SUFFIX
    apache_envvars_lock_dir: /var/lock/apache2$SUFFIX
    apache_envvars_log_dir: /var/log/apache2$SUFFIX

The following Elements are not enabled as long as the value is empty

    # Set value to activate APACHE_LYNX
    # default value: 'www-browser -dump'
    apache_envvars_lynx:

    # Set value to activate APACHE_ULIMIT_MAX_FILES
    # default value 'ulimit -n 65536'
    apache_envvars_ulimit:

    # Set value to activate APACHE_ARGUMENTS
    # defautl value: ""
    apache_envvars_arguments:

    # Set value to activate APACHE2_MAINTSCRIPT_DEBUG
    # default value: 1
    apache_envvars_maintscript_debug:


Dependencies
------------

No Package dependencies, you need apache2 installed.

Example Playbook
----------------

    - hosts: webservers
      roles:
         - { role: JHeimbach.apache_envvars, apache_envvars_run_user: www-data }

Installation
------------

Add Role to your System with `ansible-galaxy install JHeimbach.apache_envvars`

License
-------

MIT


Thanks
------
I wish to thank [geerlingguy](https://github.com/geerlingguy) for his [work](https://galaxy.ansible.com/detail#/user/219), the testing mechanism and Layout in this role is originally from his apache role.
