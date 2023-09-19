#!/bin/bash

#CHANGER ap-getway.yml les subnet dans le service

echo Update kube config
aws eks update-kubeconfig --region eu-west-3 --name petclinic-eks-cluster

helm_action = "install"
kubectl_action = "apply"

#MONITORING 
helm repo add eks https://aws.github.io/eks-charts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
    -n kube-system \
    --set clusterName=petclinic-eks-cluster \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-load-balancer-controller \
    --set region=eu-west-3 \
    --set vpcId=vpc-0502ead50d81173fe \

helm install prometheus prometheus-community/kube-prometheus-stack \
    --namespace monitoring  \
    --create-namespace \
    --set grafana.service.type=NodePort \
    --set promotheus.service.type=NodePort \

sleep 30

kubectl apply -f namespace.yml
kubectl apply -f settings/
kubectl apply -f apps/
kubectl get all -n spring-petclinic







