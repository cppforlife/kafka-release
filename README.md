# kafka-release

```
$ # ... deploy zookeeper
$ bosh -d kafka deploy manifests/example.yml
```

- https://kafka.apache.org/quickstart

## Generic Broker Integration

```
# Create kafka instance
$ sb-cli csi social-streams --service-id kafka-instance

# Create several topics
$ sb-cli csi twitter-likes --service-id kafka-topic -p instance=social-streams
$ sb-cli csi fb-likes      --service-id kafka-topic -p instance=social-streams

# Connect to a kafka topic
$ sb-cli csb twitter-likes --id binding1 -p producer=true
$ sb-cli csb fb-likes      --id binding1 -p consumer=true
```

## TODO

- smoke tests
  - https://developer.rackspace.com/blog/Apache-Kafka-Client-Benchmarks/
  - https://github.com/confluentinc/confluent-kafka-go
- perf tests
  - https://db-blog.web.cern.ch/blog/prasanth-kothuri/2016-10-benchmarking-apache-kafka-openstack-vms
- fs tweaking
  - https://kafka.apache.org/documentation/#ext4
- secure connection
  - https://kafka.apache.org/documentation/#security_ssl
  - https://www.confluent.io/blog/apache-kafka-security-authorization-authentication-encryption/
- create/delete-topic vs topic
