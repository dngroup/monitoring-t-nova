# monitoring-t-nova

Run docker monitoring

```
docker run -it -e UUID=$(curl -s http://169.254.169.254/openstack/latest/meta_data.json | sed -e 's/.*"uuid": "//; s/".*//') -e QUEUE=soft -e RABBITMQ=localhost -e METRICNAME=worker  dngroup/monitoring-t-nova
```
