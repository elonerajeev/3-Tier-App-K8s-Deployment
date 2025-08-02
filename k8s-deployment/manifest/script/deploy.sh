#!/bin/bash

set -e
set -o pipefail

echo "🚀 Starting 3-Tier Kubernetes Deployment..."

# Navigate to k8s manifests directory
if [ ! -d "k8s-deployment/manifest" ]; then
  echo "❌ Directory 'k8s-deployment/manifest' not found!"
  exit 1
fi

cd k8s-deployment/manifest

# ======================
# Create Namespace
# ======================
echo "📁 Creating Namespace..."
if [ -f namespace.yaml ]; then
  kubectl apply -f namespace.yaml
else
  echo "❌ namespace.yaml file not found!"
  exit 1
fi

# ======================
# Deploy Secrets
# ======================
echo "🔐 Deploying Secrets..."
kubectl apply -f secret/backend-secret.yaml
kubectl apply -f secret/frontend-secret.yaml

# ======================
# Deploy Backend
# ======================
echo "⚙️ Deploying Backend..."
kubectl apply -f backend/deployment.yaml
kubectl apply -f backend/service.yaml

# ======================
# Deploy Frontend
# ======================
echo "🎨 Deploying Frontend..."
kubectl apply -f frontend/deployment.yaml
kubectl apply -f frontend/service.yaml

# ======================
# Final Status
# ======================
echo "✅ Deployment completed successfully!"
kubectl get all -n mern-app

#access frontend URL
FRONTEND_POD=$(kubectl get pods -n mern-app -l app=frontend -o jsonpath="{.items[0].metadata.name}")

FRONTEND_PORT=$(kubectl get service frontend -n mern-app -o jsonpath="{.spec.ports[0].port}")

echo "Access the frontend at: http://$(minikube ip):$FRONTEND_PORT"

# ======================
#For Backend
BACKEND_POD=$(kubectl get pods -n mern-app -l app=backend -o jsonpath="{.items[0].metadata.name}")

BACKEND_PORT=$(kubectl get service backend -n mern-app -o jsonpath="{.spec.ports[0].port}")

echo "Access the backend at: http://$(minikube ip):$BACKEND_PORT"
