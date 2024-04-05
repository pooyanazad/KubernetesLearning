# Kubernetes and Docker: A Beginner's Guide

This project leverages Docker Desktop along with the `nginx:alpine` image as a means to illustrate a simple, yet effective way to teach and learn Kubernetes. It is intended to offer a hands-on experience from deployment to service monitoring and handling rollbacks.

## Step 1: Deployment

### Creating a Docker Image

Create your Docker image with the following command:

```bash
docker build -t my-nginx-image .
```

### Deploying Your Application

Proceed to deploy your application with:

```bash
kubectl apply -f nginx-deployment.yaml
```

### Observing Your Deployments

To see your deployments, execute:

```bash
kubectl get deployments
```

Expect a swift execution due to the small size of the `nginx:alpine` image.

### Creating and Monitoring Your Service

Execute the following commands to create your service and start monitoring:

```bash
kubectl apply -f nginx-service.yaml
kubectl get svc
```

For a more detailed view, use the `-o wide` switch:

```bash
kubectl get svc -o wide
```

You can access your application by typing `IP:nodeport` into your browser's address bar. The specific port can be found as indicated in the following image placeholder:

![Service Deployment](https://github.com/pooyanazad/KubernetesLearning/blob/main/getSVC.png "Service Deployment Example")

## Step 2: Rollback

### Implementing Changes

Should you decide to modify something within your HTML file, you may repeat the aforementioned steps:

- **Create the image again**:

```bash
docker build -t my-nginx-image .
```

- **Deploy your application**:

```bash
kubectl apply -f nginx-deployment.yaml
```

Creating the service anew is not necessary unless it has undergone changes:

```bash
kubectl apply -f nginx-service.yaml
```

Viewing your browser, you should now see the newly implemented changes, indicating you have successfully moved to the next version.

### Version Tracking and Rollback

To check the versions available for rollback, use:

```bash
kubectl rollout history deployment/nginx-deployment
```

Expect to see an output resembling the following:

```
deployment.apps/nginx-deployment
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
```

This list signifies two available versions. To rollback to the initial version, simply execute:

```bash
kubectl rollout undo deployment/nginx-deployment --to-revision=1
```

**Attention:** For future rollbacks, be aware that your revision numbers will change. It is essential to run `kubectl rollout history deployment/nginx-deployment` again to identify the correct version for rollback.

This document aims to foster an understanding of how Kubernetes operates through practical application. For any queries, feel free to reach out at pooyan.azadparvar@gmail.com.
