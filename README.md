🚀 Azure Platform Engineering – AKS Reference Platform

Overview

This repository contains an enterprise-grade Azure Platform Engineering implementation that provides a secure, multi-tenant AKS platform for application teams.

The platform is built using Terraform, Helm, and GitHub Actions, with security, governance, and automation by default.

Architecture

Core components:

Azure Kubernetes Service (AKS) with Azure AD integration

Azure AD groups for RBAC (platform admins & team developers)

Azure Key Vault for secrets (CSI Driver)

Ingress NGINX (shared platform ingress)

Prometheus & Grafana for observability

GitHub Actions with OIDC authentication
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

CI/CD Overview

Terraform pipeline provisions cloud infrastructure and RBAC

Platform services pipeline installs ingress, monitoring, and CSI

Application pipeline deploys apps via Helm per team namespace

All pipelines use OIDC authentication — no static secrets.

Developer Golden Path

Developer added to Azure AD group

Namespace & RBAC already available

Commit Helm values

CI/CD deploys application

App exposed via ingress

Metrics available in Grafana

Security & Governance

Azure AD–based authentication and authorization

Default-deny network policies

Namespace-level resource quotas

Secrets managed via Azure Key Vault

