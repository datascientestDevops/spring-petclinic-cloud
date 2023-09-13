#!/bin/bash


echo Update kube configg
#aws eks update-kubeconfig --region eu-west-3 --name petclinic-eks-cluster
echo update cluster kubernets...
kubectl get all -n spring-petclinic
echo apply namespace
kubectl apply -f namespace.yml
echo update config map
kubectl apply -f config-map.yml
echo update role
kubectl apply -f role.yml
echo Apply Apps
kubectl apply -f apps/