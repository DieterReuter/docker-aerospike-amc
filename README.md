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
docker run -d -p 8081:8081 -p 9001:9001 dieterreuter/aerospike-amc
```

### Run the Docker container (for testing in interactive mode)
Script: `./run.sh`
```bash
docker run -p 8081:8081 -p 9001:9001 -t -i dieterreuter/aerospike-amc
```
See our log output:
```log
/usr/lib/python2.7/dist-packages/supervisor/options.py:295: UserWarning: Supervisord is running as root and it is searching for its configuration file in default locations (including its current working directory); you probably want to specify a "-c" argument specifying an absolute path to a configuration file for improved security.
  'Supervisord is running as root and it is searching '
2014-08-10 10:41:37,553 CRIT Supervisor running as root (no user in config file)
2014-08-10 10:41:37,554 WARN Included extra file "/etc/supervisor/conf.d/supervisord.conf" during parsing
2014-08-10 10:41:37,606 INFO RPC interface 'supervisor' initialized
2014-08-10 10:41:37,607 CRIT Server 'inet_http_server' running without any HTTP authentication checking
2014-08-10 10:41:37,609 INFO RPC interface 'supervisor' initialized
2014-08-10 10:41:37,610 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2014-08-10 10:41:37,611 INFO supervisord started with pid 1
2014-08-10 10:41:38,622 INFO spawned: 'aerospike-amc' with pid 9
2014-08-10 10:41:38,865 CRIT reaped unknown pid 25)
2014-08-10 10:41:39,868 INFO success: aerospike-amc entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
```


### Our used Supervisor configuration
Configfile: `./supervisord.conf`
```config
[supervisord]
nodaemon=true

[inet_http_server]
port=0.0.0.0:9001

[program:aerospike-amc]
command=/bin/sh -c "/opt/amc/bin/start_amc_cron.sh"
```

## Start using AMC on your Mac
```bash
open open http://127.0.0.1:8081/
```

## Using Supervisor Status Console on your Mac
```bash
open open http://127.0.0.1:9001/
```


# Licensing
Copyright (c) 2014 Dieter Reuter

MIT License, see LICENSE.txt for more details.
