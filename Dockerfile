FROM ubuntu:trusty
MAINTAINER ,David Bourasseau <dbourasseau@viotech.net>


RUN apt-get -y update && apt-get -y install rsyslog curl

ADD start-cron.sh /usr/bin/start-cron.sh
RUN chmod +x /usr/bin/start-cron.sh

ADD tnova_send_metric /usr/local/bin/tnova_send_metric
RUN chmod +x /usr/local/bin/tnova_send_metric

# Run the command on container startup
CMD echo  "*/2 *  * * *   /usr/local/bin/tnova_send_metric worker $(curl -s http://$RABBITMQ:5000/api/monitoring/queuesize)" >> /var/log/cron.log 2>&1 && /usr/bin/start-cron.sh
