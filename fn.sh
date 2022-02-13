#!/usr/bin/env bash
kubectl create cm kubeconfig \
  --from-file=config=<(kubectl config view --flatten --minify) \
  --dry-run=client \
  -o yaml \
  | kustomize cfg cat \
  --wrap-kind ResourceList \
  --wrap-version \
  config.kubernetes.io/v1alpha1
