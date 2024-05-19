#!/bin/sh

@echo Create argocd namespace
kubectl create namespace argocd

@echo Pull and setup from vendor
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

@echo Setup ingress
kubectl apply -n argocd ./kind-ingress argocd-ingress.yaml
