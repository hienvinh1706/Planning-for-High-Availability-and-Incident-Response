# Infrastructure

## AWS Zones
us-west-1
us-east-2

## Servers and Clusters

### Table 1.1 Summary
| Asset           | Purpose                                                                              | Size        | Qty | DR                                                                                |
|-----------------|--------------------------------------------------------------------------------------|-------------|-----|-----------------------------------------------------------------------------------|
| EC2 instance    | VM that actually running applications                                                | t3.micro    | 3   | Deploy to main site us-east-2                                                     |
| EC2 instance    | VM that actually running applications                                                | t3.micro    | 3   | Deploy to DR site us-west-1                                                       |
| ALB             | Application Load Balancer in each region                                             | -           | 1   | Load balancer in main site                                                        |
| ALB             | Application Load Balancer in each region                                             | -           | 1   | Load balancer in DR site                                                          |
| EKS Cluster     | Cluster running K8s                                                                  | -           | 1   | K8s Cluster deploy to main site                                                   |
| EKS Cluster     | Cluster running K8s                                                                  | -           | 1   | K8s Cluster deploy to DR site                                                     |
| EKS Nodes       | Where Prometheus and Grafana deployed                                                | t3.medium   | 2   | EC2 Instancee running K8s in main site                                            |
| EKS Nodes       | Where Prometheus and Grafana deployed                                                | t3.medium   | 2   | EC2 Instancee running K8s in DR site                                              |
| EC2 keypair     | keypair for creating EC2 instance                                                    | -           | 1   | Deploy to main site                                                               |
| EC2 keypair     | keypair for creating EC2 instance                                                    | -           | 1   | Deploy to DR site                                                                 |
| Code repository | Either Github or locally stored (preferably Github for collaboration)                | -           | 2   | Use for both sites, better apply branching or method to separate DR and main site |
| RDS             | Database service for application use                                                 | db.t2.small | 2   | Deploy to  main site                                                              |
| RDS             | Database service for application use                                                 | db.t2.small | 2   | Deploy to  DR site                                                                |
| VPC             | VPC covers multiple AZs for highly availability Architecture                         | -           | 1   | Deploy to main site                                                               |
| VPC             | VPC covers multiple AZs for highly availability Architecture - deploy to backup site | -           | 1   | Deploy to main site                                                               |



### Descriptions
EC2 instances: Backend of applications running within this project, including web server, and Prometheus/Grafana for SRE work
EC2 keypair: needed to create EC2 instances
ALB: load balancer to distribute load for high availability
EKS Cluster: having several EKS nodes running k8s service on AWS cloud to manage the availability and scalability of underlying containers 
Code repository: Storing IaC, template and also other code for making up the infrastructure
RDS: Database service for application use
VPC: isolated virtual network for running other AWS service like EC2


## DR Plan
### Pre-Steps:
Git branching - create new branch for DR in another Region
Check for DB replica stale state
Prepare checklist to merge back changes when main region again reaching it stable status

## Steps:
Deploy new code from Git to DR region
Switch to Replica DB Instance/Use backup data to restore DB
Update monitoring stack to monitor in DR region
Take down Main region after route traffic to DR region