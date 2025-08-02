#!/bin/bash

set -e  # Exit on any error
set -o pipefail

echo "🚀 Starting environment setup for Minikube and Kubernetes..."

# ========== Function Helpers ==========
function check_command {
  command -v "$1" &> /dev/null || { echo "❌ $1 not found. Please install it manually."; exit 1; }
}

# ========== Docker Setup ==========
echo "🔧 Installing Docker..."
sudo apt-get update -y
sudo apt-get install docker.io -y

echo "👤 Adding user to docker group..."
sudo usermod -aG docker "$USER"

echo "⚠️ You must restart your terminal or run 'newgrp docker' to apply Docker group changes"

# ========== kubectl Setup ==========
echo "📦 Installing kubectl..."
curl -sLO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

check_command kubectl
echo "✅ kubectl installed."

# ========== Minikube Setup ==========
echo "📦 Installing Minikube..."
curl -sLO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm -f minikube-linux-amd64

check_command minikube
echo "✅ Minikube installed."

# ========== Start Minikube ==========
echo "🚀 Starting Minikube with Docker driver..."
minikube start --driver=docker

# ========== Status Check ==========
echo "🩺 Checking status..."
minikube status
docker ps
kubectl version --client=true

# ========== Clone Project ==========
REPO_URL="https://github.com/elonerajeev/3-Tier-App-K8s-Deployment.git"
FOLDER_NAME="3-Tier-App-K8s-Deployment"

if [ ! -d "$FOLDER_NAME" ]; then
  echo "📥 Cloning project repository..."
  git clone "$REPO_URL"
else
  echo "📁 Project already cloned."
fi

cd "$FOLDER_NAME" || { echo "❌ Could not access project directory"; exit 1; }

# ========== Docker Login ==========
echo "🔐 Logging into Docker Hub..."
if ! docker login; then
  echo "❌ Docker login failed. Exiting..."
  exit 1
fi

# ========== Build & Push Images ==========
echo "🐳 Building and pushing Docker images..."

echo "📦 Frontend"
docker build -t myapp-frontend:v1 ./frontend
docker tag myapp-frontend:v1 elonerajeev/myapp-frontend:v1
docker push elonerajeev/myapp-frontend:v1

echo "📦 Backend"
docker build -t myapp-backend:v1 ./backend
docker tag myapp-backend:v1 elonerajeev/myapp-backend:v1
docker push elonerajeev/myapp-backend:v1

echo "✅ All images built and pushed successfully."

echo "🎉 Minikube environment is ready!"
