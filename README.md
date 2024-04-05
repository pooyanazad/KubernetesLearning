Learning Kubernetes with Docker and Nginx:alpine

In this project, I used Docker Desktop and the nginx:alpine image to learn Kubernetes. This project demonstrates a simple deployment process using a lightweight container, as well as service monitoring and rollback capabilities.
Step 1: Deployment
Create Docker Image

First, create your Docker image by running the following command:

docker build -t my-nginx-image .

Create Kubernetes Deployment

Next, create your Kubernetes deployment using the following command:

kubectl apply -f nginx-deployment.yaml

View Deployments

To view your deployments, run the following command:

kubectl get deployments

It should be fast because we are using a small image like nginx:alpine.
Create and Monitor Service

Create and monitor your service with the following commands:

kubectl apply -f nginx-service.yaml
kubectl get svc

You can also see more data by using the -o wide switch:

kubectl get svc -o wide

You can access your app by typing IP:nodeport in your browser. You can find the port as shown in the below image:

[Image of port]
Step 2: Rollback
Make Changes

For this example, you can change something in the HTML file and do the following:

    Create image:

docker build -t my-nginx-image .

    Create deployment:

kubectl apply -f nginx-deployment.yaml

    Create service: (Not necessary because we didn’t change anything)

kubectl apply -f nginx-service.yaml

You should now see the changes in your browser, indicating that you have moved to the next version.
Check Versions and Rollback

To view the versions for rollback, run the following command:

kubectl rollout history deployment/nginx-deployment

The output should look something like this:

deployment.apps/nginx-deployment
REVISION  CHANGE-CAUSE
1         <none>
2         <none>

This indicates that you have two versions. To rollback to the first version, run the following command:

kubectl rollout undo deployment/nginx-deployment --to-revision=1

Attention: In the future, if you want to rollback to your last version, your revision numbers will change, so you should run the kubectl rollout history deployment/nginx-deployment command again to find the correct versions for rollback.

I hope this document helps you to understand how Kubernetes works. If you have any questions, please feel free to reach out to me at pooyan.azadparvar@gmail.com.
