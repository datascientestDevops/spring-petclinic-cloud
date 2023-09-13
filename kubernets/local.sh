#!/bin/bash

kubectl delete -f namespace.yml --grace-period=0 --force

#init a namespace
kubectl apply -f namespace.yml

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install vets-db-mysql bitnami/mysql --namespace spring-petclinic-dev --version 9.10.10 --set auth.database=service_instance_db --set auth.rootPassword=datascientest_petclinic
helm install visits-db-mysql bitnami/mysql --namespace spring-petclinic-dev  --version 9.10.10 --set auth.database=service_instance_db --set auth.rootPassword=datascientest_petclinic
helm install customers-db-mysql bitnami/mysql --namespace spring-petclinic-dev  --version 9.10.10 --set auth.database=service_instance_db --set auth.rootPassword=datascientest_petclinic


# init all services (ClusterIp for services and LoadBalancer for api-getway)
kubectl apply -f services

# launch all deployment pods
kubectl apply -f deployments

#Check ALL
kubectl get all -n spring-petclinic-dev
