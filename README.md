🚀 Azure Platform Engineering – AKS Reference Platform
Overview

This repository implements an enterprise-grade Azure Platform Engineering setup for AKS. It provides a secure, multi-tenant platform for application teams with automation, governance, and CI/CD pipelines.

Built with: Terraform, Helm, and GitHub Actions.

Architecture

Core components:

Azure Kubernetes Service (AKS) with Azure AD integration

Azure AD groups for RBAC (Platform Admins & Team Developers)

Azure Key Vault for secrets (via CSI Driver)

Ingress NGINX (shared platform ingress)

Prometheus & Grafana for observability

GitHub Actions pipelines using OIDC authentication
📷 See: diagrams/project1_platform.png

Platform Capabilities

Multi-team namespaces with RBAC isolation

Secure secrets injection (no secrets in Git)

Network policies (default deny)

Resource quotas & limits for cost control

Centralized ingress & monitoring

Fully automated CI/CD pipelines

Ownership Model

| Area                   | Platform Team | App Teams |
| ---------------------- | ------------- | --------- |
| Infrastructure & AKS   | ✅             | ❌         |
| Platform services      | ✅             | ❌         |
| Security & governance  | ✅             | ❌         |
| Application deployment | ❌             | ✅         |


CI/CD Pipelines

Terraform Pipeline – provisions infrastructure, namespaces, RBAC, and KeyVault.

Platform Services Pipeline – deploys ingress, observability, and security manifests.

Application Pipeline – deploys apps per team namespace using Helm.

All pipelines use GitHub OIDC — no static secrets required.


Developer Golden Path

Developer added to Azure AD group

Namespace & RBAC are already available

Commit Helm values for the app

CI/CD deploys the application

App exposed via Ingress

Metrics available in Grafana

Security & Governance

Azure AD–based authentication and authorization

Default-deny network policies

Namespace-level resource quotas

Secrets managed via Azure Key Vault

Folder & Module Structure (High-Level)
├── .github/workflows       # GitHub Actions workflows
├── diagrams                # Architecture diagrams
├── helm-charts             # Helm charts for apps and generic templates
├── terraform               # Terraform main files & modules
│   └── modules
│       ├── aad_groups
│       ├── aks
│       └── k8s_platform
│           ├── apps
│           └── platform/security/governance/network-policies
└── README.md

✅ Note: All platform components and app deployments are fully automated using Terraform and Helm, following production-grade patterns.

