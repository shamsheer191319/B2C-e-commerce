# Setup Instructions

## Prerequisites

- Install [Terraform](https://www.terraform.io/downloads)
- Install [Docker](https://docs.docker.com/get-docker/)
- Install [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- Install [Helm](https://helm.sh/docs/intro/install/)
- AWS CLI configured with required permissions
- GitHub repository for CI/CD pipeline

## Step 1: Infrastructure Provisioning (Terraform)

1. Clone the repository:
   ```bash
   git clone <repo_url>
   cd terraform
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Plan and apply Terraform configuration:
   ```bash
   terraform apply -auto-approve
   ```
4. Verify the provisioned AWS resources using the AWS Console or CLI.

## Step 2: Containerization and Deployment (Kubernetes)

1. Build and tag the Docker image:
   ```bash
   docker build -t <your-registry>/ecommerce-app:latest .
   docker push <your-registry>/ecommerce-app:latest
   ```
2. Deploy the application using Helm:
   ```bash
   helm install ecommerce helm-chart/
   ```
3. Verify the deployment:
   ```bash
   kubectl get pods -n ecommerce
   ```

## Step 3: CI/CD Pipeline Setup

1. Set up GitHub Actions workflow in `.github/workflows/deploy.yml`
2. Push changes to trigger the pipeline:
   ```bash
   git add .
   git commit -m "Added CI/CD pipeline"
   git push origin main
   ```

## Step 4: Monitoring and Observability

1. Deploy Prometheus and Grafana using Helm:
   ```bash
   helm install prometheus-stack prometheus-community/kube-prometheus-stack
   ```
2. Access Grafana dashboard:
   ```bash
   kubectl port-forward svc/grafana 3000:80
   ```
3. Login to Grafana (default user: `admin`, password: `prom-operator`)

## Step 5: Database and Caching

1. Deploy PostgreSQL using AWS RDS and enable read replicas.
2. Deploy Redis using AWS ElastiCache for caching product listings and session data.

## Step 6: Security Setup

1. Configure IAM roles and least-privilege access.
2. Store sensitive credentials in HashiCorp Vault.
3. Implement JWT authentication for API endpoints.

## Step 7: Scalability and Resilience

1. Enable Kubernetes Horizontal Pod Autoscaler:
   ```bash
   kubectl autoscale deployment ecommerce-app --cpu-percent=50 --min=2 --max=10
   ```
2. Test failure recovery using Chaos Monkey or Gremlin.

## Step 8: Cost Management

1. Enable AWS Cost Explorer for tracking cloud expenses.
2. Tag resources based on environment, team, or project for cost allocation.
3. Set up budget alerts to monitor unexpected cost spikes.
4. Use AWS Trusted Advisor to identify underutilized resources.
5. Implement auto-scaling and serverless solutions to optimize costs.

---

# Architecture Diagram

![diagram](https://github.com/user-attachments/assets/ec501348-d0a8-4b86-aa52-1c4a4d856edc)

---
# Loom Video

https://www.loom.com/share/4cdec0dafc1443138619509c5e49b506?sid=e334a76a-6b13-4655-9712-e5831a05d68d

---

# Tool Choices and Justifications

| Tool                      | Purpose                 | Justification                                               |
| ------------------------- | ----------------------- | ----------------------------------------------------------- |
| Terraform                 | Infrastructure as Code  | Automates multi-region AWS resource provisioning            |
| Kubernetes (EKS)          | Container Orchestration | Manages scalable microservices-based application            |
| Docker                    | Containerization        | Ensures application consistency across environments         |
| Helm                      | Kubernetes Deployment   | Simplifies app deployment and version control               |
| GitHub Actions            | CI/CD Automation        | Automates build, test, and deployment pipelines             |
| AWS RDS (PostgreSQL)      | Database                | Managed relational database with read replicas              |
| AWS ElastiCache (Redis)   | Caching                 | Reduces database load and improves performance              |
| Prometheus & Grafana      | Monitoring              | Provides real-time observability of infrastructure and apps |
| AWS IAM & HashiCorp Vault | Security                | Implements access control and secrets management            |
| AWS Auto Scaling          | Scalability             | Ensures dynamic scaling based on traffic load               |
| AWS Cost Explorer         | Cost Management         | Monitors and optimizes cloud spending                       |
| AWS Trusted Advisor       | Cost Management         | Identifies underutilized and misconfigured resources        |
| AWS Budgets               | Cost Management         | Sends alerts for unexpected cost spikes                     |



