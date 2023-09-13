#!/bin/bash


#init a namespace
kubectl apply -f namespace.yml

# init all services (ClusterIp for services and LoadBalancer for api-getway)
kubectl apply -f services

# launch all deployment pods
kubectl apply -f deployments
