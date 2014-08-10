# docker-aerospike-amc

Run [AeroSpike Monitoring Console](http://www.aerospike.com/aerospike-monitoring-console/) inside of `Docker`.

### Build the Docker container
Script: `./build.sh`
```bash
docker build -t dieterreuter/aerospike-amc .
```

### Run the Docker container (for production in the background)
Script: `./run.sh`
```bash
docker run -d -p 8081:8081 dieterreuter/aerospike-amc
```

### Run the Docker container (for testing in interactice mode)
Script: `./run.sh`
```bash
docker run -p 8081:8081 -t -i dieterreuter/aerospike-amc
```
See our log output:
```log
/usr/lib/python2.7/dist-packages/supervisor/options.py:295: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  'Supervisord is running as root and it is searching '
2014-08-10 10:16:22,874 CRIT Supervisor running as root (no user in config file)
2014-08-10 10:16:22,875 WARN Included extra file "/etc/supervisor/conf.d/supervisord.conf" during parsing
2014-08-10 10:16:22,922 INFO RPC interface 'supervisor' initialized
2014-08-10 10:16:22,924 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2014-08-10 10:16:22,925 INFO supervisord started with pid 1
2014-08-10 10:16:23,937 INFO spawned: 'aerospike-amc' with pid 9
2014-08-10 10:16:24,187 CRIT reaped unknown pid 25)
2014-08-10 10:16:25,190 INFO success: aerospike-amc entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
```


### Our used Supervisor configuration
Configfile: `./supervisord.conf`
```config
[supervisord]
nodaemon=true

[program:amc]
command=/bin/sh -c "/opt/amc/bin/start_amc_cron.sh"
```


# Licensing
Copyright (c) 2014 Dieter Reuter

MIT License, see LICENSE.txt for more details.
