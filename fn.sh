#!/usr/bin/sh bash
kubectl create cm kubeconfig \
  --from-file=~/.kube/config \
  --dry-run=client \
  -o yaml \
  | kustomize cfg cat \
  --wrap-kind ResourceList \
  --wrap-version \
  config.kubernetes.io/v1alpha1
