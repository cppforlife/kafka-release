#!/bin/bash

set -e # -x

echo "-----> `date`: Upload stemcell"
bosh -n upload-stemcell "https://bosh.io/d/stemcells/bosh-warden-boshlite-ubuntu-trusty-go_agent?v=3541.9" \
  --sha1 44138ff5e30cc1d7724d88eaa70fab955b8011bd \
  --name bosh-warden-boshlite-ubuntu-trusty-go_agent \
  --version 3541.9

echo "-----> `date`: Check on zookeeper deployment"
bosh -n -d zookeeper deployment

echo "-----> `date`: Delete previous deployment"
bosh -n -d kafka delete-deployment --force

echo "-----> `date`: Deploy"
( set -e; cd ./..; bosh -n -d kafka deploy ./manifests/example.yml -o ./manifests/dev.yml )

echo "-----> `date`: Recreate all VMs"
bosh -n -d kafka recreate

echo "-----> `date`: Exercise deployment via smoke-tests"
bosh -n -d kafka run-errand smoke-tests

echo "-----> `date`: Restart deployment"
bosh -n -d kafka restart

echo "-----> `date`: Report any problems"
bosh -n -d kafka cck --report

echo "-----> `date`: Delete random VM"
bosh -n -d kafka delete-vm `bosh -d kafka vms --column vm_cid|sort|head -1`

echo "-----> `date`: Fix deleted VM"
bosh -n -d kafka cck --auto

echo "-----> `date`: Delete deployment"
bosh -n -d kafka delete-deployment

echo "-----> `date`: Done"
