# Kafka BOSH release

```
$ # ... deploy zookeeper
$ bosh -d kafka deploy manifests/example.yml -o manifests/dev.yml
$ bosh -d kafka run-errand smoke-tests
```

- https://kafka.apache.org/quickstart

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
