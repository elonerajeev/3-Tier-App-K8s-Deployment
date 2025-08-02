#!/bin/bash

set -e
set -o pipefail

NAMESPACE="mern-app"

echo "⚠️  WARNING: This will delete all resources in the '$NAMESPACE' namespace."
read -p "Are you sure you want to continue? (y/N): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
  echo "❌ Cleanup aborted."
  exit 0
fi

echo "🧹 Starting cleanup of 3-Tier app in namespace '$NAMESPACE'..."

# Navigate to manifest directory
if [ ! -d "k8s-deployment/manifest" ]; then
  echo "❌ Directory 'k8s-deployment/manifest' not found!"
  exit 1
fi

cd k8s-deployment/manifest

# Delete Frontend resources
echo "🔥 Deleting Frontend..."
kubectl delete -f frontend/service.yaml -n $NAMESPACE || true
kubectl delete -f frontend/deployment.yaml -n $NAMESPACE || true

# Delete Backend resources
echo "🔥 Deleting Backend..."
kubectl delete -f backend/service.yaml -n $NAMESPACE || true
kubectl delete -f backend/deployment.yaml -n $NAMESPACE || true

# Delete Secrets
echo "🗝️  Deleting Secrets..."
kubectl delete -f secret/frontend-secret.yaml -n $NAMESPACE || true
kubectl delete -f secret/backend-secret.yaml -n $NAMESPACE || true

# Delete Namespace
echo "🧨 Deleting Namespace: $NAMESPACE"
kubectl delete namespace $NAMESPACE || true

echo "✅ Cleanup completed!"
