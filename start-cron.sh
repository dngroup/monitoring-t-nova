#!/bin/sh
#echo $UUID > /tmp/instance_uuid
/bin/mkdir -p /etc/collectd/
echo $UUID >/etc/collectd/instance_uuid

while true
do
   echo "working"
   /usr/local/bin/tnova_send_metric $METRICNAME $(/usr/local/bin/worker_metric)   
   sleep 60

done

