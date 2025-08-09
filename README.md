# 🚀 3-Tier-Architecture-App Deployment Using Kubernetes (Minikube+Helm+..)

<div align="center">

[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
![Docker](https://img.shields.io/badge/Container-Docker-2496ED?style=for-the-badge&logo=docker)
![Minikube](https://img.shields.io/badge/Local-Minikube-F7931E?style=for-the-badge&logo=kubernetes&logoColor=white)
![Mongo](https://img.shields.io/badge/Database-MongoDB-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

**Production-ready 3-tier application deployment showcasing modern container orchestration**

[🔥 Live Demo](#-accessing-the-application) • [📖 Documentation](#-table-of-contents) • [🛠️ Getting Started](#-quick-start) • [💼 Portfolio](https://rajeevxportfolio.netlify.app)

</div>

---

## 📋 Table of Contents

- [🎯 Project Overview](#-project-overview)
- [🏗️ Architecture](#️-architecture)
- [🧰 Technology Stack](#-technology-stack)
- [✨ Key Features](#-key-features)
- [🚀 Quick Start](#-quick-start)
- [📁 Project Structure](#-project-structure)
- [🔄 Deployment Pipeline](#-deployment-pipeline)
- [💡 Implementation Highlights](#-implementation-highlights)
- [🎯 Challenges & Solutions](#-challenges--solutions)
- [📈 Monitoring & Observability](#-monitoring--observability)
- [🔮 Future Roadmap](#-future-roadmap)
- [🤝 Contributing](#-contributing)
- [👨‍💻 Author](#-author)
- [📄 License](#-license)

---

## 🎯 Project Overview

This project demonstrates **enterprise-grade Kubernetes deployment** by building a complete 3-tier application with modern container orchestration practices. The application showcases scalable microservices architecture with proper service mesh, persistent storage, and production-ready configurations.

### 🎪 What Makes This Special?

- **🔄 Full Container Orchestration**: Complete Kubernetes deployment with service discovery
- **🏗️ Scalable Architecture**: Independent scaling of frontend, backend, and database tiers
- **📊 Production Ready**: Health checks, monitoring, and persistent storage
- **💰 Resource Optimized**: Efficient resource allocation with Minikube deployment

---

## 🏗️ Architecture

![Architecture Diagram](Report/3-tier-app-k8s-deployment%20architecture%20diagram.png.png)

---

## 🧰 Technology Stack

<div align="center">

| **Category**                   | **Technologies**                   |
| ------------------------------ | ---------------------------------- |
| **☸️ Container Orchestration** | Kubernetes, Minikube               |
| **🐳 Containerization**        | Docker, Docker Compose             |
| **🎨 Frontend Framework**      | React.js, Vue.js, Nginx            |
| **⚙️ Backend Services**        | Node.js, Express.js, RESTful APIs  |
| **🗄️ Database**                | MongoDB Altas String               |
| **📊 Monitoring**              | Prometheus, Grafana, Health Checks |
| **🔧 Configuration**           | ConfigMaps, Environment Variables  |

</div>

---

## ✨ Key Features

### 🎯 Kubernetes Native Architecture

- **🧩 Microservices Design**: Independently deployable and scalable tiers
- **🌍 Service Discovery**: Native Kubernetes DNS and service networking
- **🔄 Auto-healing**: Kubernetes controllers ensure desired state

### 🚀 Production-Ready Deployment

- **⚡ Rolling Updates**: Zero-downtime deployments with rolling update strategy
- **🐳 Multi-Container Pods**: Sidecar patterns and init containers
- **📡 Load Balancing**: Built-in service load balancing and traffic distribution
- **🔍 Health Monitoring**: Comprehensive liveness and readiness probes

### 🛡️ Security & Best Practices

- **🔐 Secrets Management**: Kubernetes secrets for sensitive data
- **🌐 Network Security**: Network policies and service mesh integration
- **🚪 Access Control**: RBAC with service accounts and role bindings
- **🔒 Pod Security**: Security contexts and non-root containers

### 📊 Observability & Monitoring

- **📈 Metrics Collection**: Prometheus integration for custom metrics
- **📊 Dashboard Visualization**: Grafana dashboards for monitoring
- **🔍 Logging**: Centralized logging with structured log formats
- **🚨 Alerting**: Alert manager integration for critical events

---

## 🚀 Quick Start (Check Script In repo)

### Prerequisites

```bash
# Required tools
kubectl version --client    # Kubernetes CLI >= 1.25.0
minikube version           # Minikube >= 1.28.0
docker --version          # Docker >= 20.10.0
git --version            # Git
```

### 1️⃣ Clone & Setup

```bash
git clone https://github.com/elonerajeev/3-Tier-App-K8s-Deployment.git
cd 3-Tier-App-K8s-Deployment
```

### 4️⃣ Deploy Application

```bash
# Deploy entire 3-tier application
make deploy
# or use the deployment script:
# chmod +x scripts/deploy.sh && ./scripts/deploy.sh

# Verify deployment
kubectl get pods -n mern-app(namespace)
```

### 5️⃣ Access Application

```bash
# Get application URL
minikube service -n 3tier-app frontend --url
# or use port forwarding:
# kubectl port-forward -n 3tier-app service/frontend 3000:3000
```

---

## 📁 Project Structure

```
📦 3-Tier-App-K8s-Deployment/
├── 🎨 frontend/
│   ├── src/                         # React/Vue source code
│   ├── public/                      # Static assets
│   ├── Dockerfile                   # Frontend container image
│   ├── package.json                 # Dependencies
│   └── nginx.conf                   # Nginx configuration
├── ⚙️ backend/
│   ├── src/                         # Node.js application
│   │   ├── controllers/             # API controllers
│   │   ├── models/                  # Data models
│   │   ├── routes/                  # API routes
│   │   └── middleware/              # Express middleware
│   ├── Dockerfile                   # Backend container image
│   ├── package.json                 # Dependencies
│   └── healthcheck.js               # Health check endpoint
|   └── index.js.js                  # main check endpoint
|
├── ☸️ k8s/
│   ├── namespace.yaml               # Kubernetes namespace
│   ├── frontend/
│   │   ├── deployment.yaml          # Frontend deployment
│   │   ├── service.yaml             # Frontend service
│   │   └── configmap.yaml           # Frontend configuration(Optional)
│   ├── backend/
│   │   ├── deployment.yaml          # Backend deployment
│   │   ├── service.yaml             # Backend service
│   │   ├── configmap.yaml           # Backend configuration(Optional)
│   │   └── secret.yaml              # Backend secrets(Optional)
│   ├── ingress/
│   │   └── ingress.yaml             # Ingress controller(Optional)
│   └── monitoring/
│       ├── prometheus.yaml          # Prometheus configuration
│       └── grafana.yaml             # Grafana dashboards
├── 🛠️ scripts/
│   ├── setup-minikube.sh            # Minikube setup script
│   ├── deploy.sh                    # Deployment automation
│   ├── cleanup.sh                   # Resource cleanup
│   └── port-forward.sh              # Port forwarding helper
├── 📊 monitoring/
│   ├── dashboards/                  # Grafana dashboards
│   ├── alerts/                      # Alert configurations
│   └── prometheus.yml               # Prometheus config
├── 🔧 configs/
│   ├── nginx.conf                   # Nginx configurations
│   └── app.conf                     # Application configurations
├── 📖 docs/
│   ├── DEPLOYMENT.md                # Deployment guide
│   ├── ARCHITECTURE.md              # Architecture documentation
│   └── TROUBLESHOOTING.md           # Troubleshooting guide
├── Makefile                         # Automation commands
└── docker-compose.yml               # Local development setup
```

---

## 🔄 Deployment Pipeline

### Deployment Workflow (Will Do In Fature With CICD Pipeline)

```yaml
# Automated Deployment Process
stages:
  - 🔍 validate:
      - syntax-check
      - security-scan
  - 🏗️ build:
      - docker-build
      - image-push
  - 🧪 test:
      - unit-tests
      - integration-tests
  - 🚀 deploy:
      - k8s-deployment
      - health-check
```

### Deployment Stages

| **Stage**         | **Action**                  | **Status** |
| ----------------- | --------------------------- | ---------- |
| 🔍 **Validation** | YAML lint and security scan | ✅ Active  |
| 🏗️ **Build**      | Docker image creation       | ✅ Active  |
| 🧪 **Test**       | Unit and integration tests  | ✅ Active  |
| 📤 **Registry**   | Push to container registry  | ✅ Active  |
| 🚀 **Deploy**     | Kubernetes deployment       | ✅ Active  |
| ✅ **Verify**     | Health check validation     | ✅ Active  |

---

## 💡 Implementation Highlights

### 🏗️ Kubernetes Deployment Configuration

```yaml
# Example: Backend Deployment with Health Checks

apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend-deployment
  namespace: mern-app
  labels:
    app: myapp
spec:
  replicas: 2
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
        - name: backend-container
          image: elonerajeev/myapp-backend:v1
          ports:
            - containerPort: 5000
          envFrom:
            - secretRef:
                name: backend-secret
```

### 🐳 Optimized Multi-Stage Docker Build

```dockerfile
# Frontend Production Build
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production && npm cache clean --force
COPY . .
RUN npm run build

FROM nginx:alpine AS runtime
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### 🔄 Automated Deployment Script (Full Script In Available In Repo)

```bash
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
# Deploy Backend
# ======================
echo "⚙️ Deploying Backend..."
kubectl apply -f backend/deployment.yaml
kubectl apply -f backend/service.yaml
```

---

## 🎯 Challenges & Solutions

<details>
<summary><strong>🔧 Kubernetes Challenges</strong></summary>

| **Challenge**       | **Solution**                          | **Impact**     |
| ------------------- | ------------------------------------- | -------------- |
| Service Discovery   | Kubernetes DNS and service networking | ✅ Resolved    |
| Resource Management | Resource requests and limits          | ⚡ Performance |
| Health Monitoring   | Liveness and readiness probes         | 🔍 Reliability |

</details>

<details>
<summary><strong>🚀 Container Challenges</strong></summary>

| **Challenge**               | **Solution**                     | **Impact**       |
| --------------------------- | -------------------------------- | ---------------- |
| Image Size Optimization     | Multi-stage Docker builds        | 🚀 Performance   |
| Configuration Management    | ConfigMaps and Secrets           | 🔐 Security      |
| Inter-service Communication | Service mesh and networking      | 🌐 Connectivity  |
| Rolling Updates             | Kubernetes deployment strategies | 🔄 Zero-downtime |

</details>

---

## 📈 Monitoring & Observability (Working ....)

### 📊 Application Metrics Dashboard

```bash
# Access Prometheus metrics
curl http://localhost:9090/metrics

# Grafana Dashboard
kubectl port-forward -n monitoring service/grafana 3000:3000
# Access: http://localhost:3000
```

### Key Metrics Monitored

- **🎯 Application Performance**: Response time, throughput, error rates
- **📊 Resource Utilization**: CPU, memory, disk usage per pod
- **🌐 Network Metrics**: Request/response latency, connection counts
- **🗄️ Database Performance**: Query performance, connection pools

### Monitoring Stack

- **📊 Prometheus**: Metrics collection and alerting
- **📈 Grafana**: Visualization dashboards
- **🔍 Kubernetes Dashboard**: Cluster monitoring
- **📱 AlertManager**: Alert notifications

---

## 🔮 Future Roadmap

### Phase 1: Enhanced Security 🛡️

- [ ] Add network policies
- [ ] Integrate Kubernetes secrets management

### Phase 2: Advanced Features 🚀

- [ ] Horizontal Pod Autoscaling (HPA)
- [ ] Blue-green deployment strategy
- [ ] Canary deployments

### Phase 3: Production Readiness 🏭

- [ ] Multi-cluster deployment
- [ ] GitOps with ArgoCD

### Phase 4: Cloud Migration ☁️

- [ ] EKS/GKE/AKS deployment
- [ ] Terraform for infrastructure
- [ ] CI/CD with GitHub Actions

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### 🔧 Development Setup

```bash
# Fork the repository
git clone https://github.com/your-username/3-Tier-App-K8s-Deployment.git

# Create feature branch
git checkout -b feature/your-feature-name

# Make changes and test
make test

# Submit pull request
```

### 📝 Contribution Guidelines

- Follow Kubernetes best practices
- Write comprehensive tests
- Update documentation
- Use meaningful commit messages
- Ensure security standards

---

## 👨‍💻 Author : elonerajeev

<div align="center">

<img src="https://rajeevxportfolio.netlify.app/images/pictures/profile-pic%20(1)%20(1).png" width="100" height="100" style="border-radius: 50%;">

**Rajeev Kumar**
_Kubernetes Specialist & DevOps Engineer_

[![Portfolio](https://img.shields.io/badge/Portfolio-FF5722?style=for-the-badge&logo=todoist&logoColor=white)](https://rajeevxportfolio.netlify.app)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/rajeev-kumar-2209b1243)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/elonerajeev)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:elonerajeev@gmail.com)

_"Orchestrating containers and building scalable cloud-native applications"_

</div>

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

```
MIT License - Feel free to use this project for learning and development!
```

---

<div align="center">

### 🌟 If you found this project helpful, please give it a star!

[![GitHub stars](https://img.shields.io/github/stars/elonerajeev/3-Tier-App-K8s-Deployment?style=social)](https://github.com/elonerajeev/3-Tier-App-K8s-Deployment/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/elonerajeev/3-Tier-App-K8s-Deployment?style=social)](https://github.com/elonerajeev/3-Tier-App-K8s-Deployment/network/members)

**Made with ❤️ and ☕ by Rajeev Kumar**

---

### 🚀 Ready to deploy your 3-tier application on Kubernetes?

**[Get Started Now](#-quick-start) • [View Architecture](#️-architecture) • [Join Community](#-contributing)**

</div>
