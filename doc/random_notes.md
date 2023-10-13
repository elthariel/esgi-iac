## Kubernetes

- K8s = Control plane + nodes
- Pod = A logical unit:
  - with a single network address
  - one or more containers
  - some resources sharing facilities
- Services:
  - ClusterIP, internal services
  - NodePort port, external service. A random external port is routed to the
    internal service
  - LoadBalancer: Provision a LB in the cloud provider
