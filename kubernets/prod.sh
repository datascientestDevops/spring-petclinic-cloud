#!/bin/bash


#init a namespace
kubectl apply -f namespace.yml

# init all services (ClusterIp for services and LoadBalancer for api-getway)
kubectl apply -f services
# Check services was created
kubectl get svc -n spring-petclinic

# launch all deployment pods
kubectl apply -f deployments
