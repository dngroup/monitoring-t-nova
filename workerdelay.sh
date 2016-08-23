curl -X POST "http://localhost:15672/api/queues/%2F/soft/get" -d '{"vhost":"/","name":"soft","truncate":"50000","requeue":"true","encoding":"auto","count":"1"}' -u guest:guest | json_pp |grep "\"payload\"" | sed 's/.*eta\\":\\"//;s/\\".*//'
curl -s -X POST "http://localhost:15672/api/queues/%2F/soft/get" -d '{"vhost":"/","name":"soft","truncate":"50000","requeue":"true","encoding":"auto","count":"1"}' -u guest:guest |  sed 's/.*eta\\":\\"//;s/\\".*//'


echo $(($(date +%s)-$(date +%s -d $(curl -s -X POST "http://localhost:15672/api/queues/%2F/soft/get" -d '{"vhost":"/","name":"soft","truncate":"50000","requeue":"true","encoding":"auto","count":"1"}' -u guest:guest |  sed 's/.*eta\\":\\"//;s/\\".*//'))))
echo $(($(date +%s)-$(date +%s -d $(curl -s -X POST "http://localhost:15672/api/queues/%2F/soft/get" -d '{"vhost":"/","name":"soft","truncate":"50000","requeue":"true","encoding":"auto","count":"1"}' -u guest:guest |  sed 's/.*eta\\":\\"//;s/\\".*//')|| date +%s)))
