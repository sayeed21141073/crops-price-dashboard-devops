# Crop Price Dashboard - DevOps Infrastructure

This repository contains all **DevOps and Infrastructure-as-Code** setup for deploying the **Crop Price Dashboard** project on AWS EKS with monitoring and GitOps.

---

## **DevOps Overview**

We implement a **full cloud deployment and GitOps pipeline**:

1. **Docker & ECR**
   - Multi-stage Docker images for all microservices.
   - Images pushed to **AWS Elastic Container Registry (ECR)**.

2. **Kubernetes (EKS)**
   - Deploy microservices using **Deployments, Services, ConfigMaps, and Ingress**.
   - Cluster networking includes:
     - **VPC**
     - **Public & Private Subnets**
     - **Internet Gateway (IGW)**
     - **Route Tables**
     - **Security Groups**
     - **IAM Roles**
     - **EKS Worker Nodes**

3. **Terraform**
   - Automates creation of:
     - EKS Cluster
     - Networking (VPC, subnets, IGW, route tables)
     - IAM Roles & Policies
     - Security Groups
     - All cloud resources required for the project

4. **Write Kubernetes manifests** – Define Deployments, Services, ConfigMaps, Ingress and namespaces in yaml for each microservice to run on EKS.


5. **Monitoring**
   - **Prometheus** to collect metrics from Kubernetes and microservices.
   - **Grafana** to visualize metrics via dashboards.

6. **GitOps Deployment**
   - **ArgoCD** watches the Git repository for K8s manifests and automatically applies changes to the cluster.

---
