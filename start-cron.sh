#!/bin/sh
#echo $UUID > /tmp/instance_uuid
/bin/mkdir -p /etc/collectd/
echo $UUID >/etc/collectd/instance_uuid


echo  "*/2 *  * * *   /usr/local/bin/tnova_send_metric $METRICNAME /$(worker_metric)" |  crontab 

cron -f -L 15
