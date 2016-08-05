#!/bin/sh
echo $UUID > /tmp/instance_uuid
/bin/mkdir -p /etc/collectd/
echo $UUID >/etc/collectd/instance_uuid

rsyslogd
cron
touch /var/log/cron.log
tail -F /var/log/syslog /var/log/cron.log
