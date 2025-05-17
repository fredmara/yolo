1. Choice of Kubernetes Objects Used for Deployment
    For the deployment of this application, I used the following Kubernetes objects:

      Frontend and Backend Deployments: I used Deployments to manage these services. This allows for easy scaling, rolling updates, high availability through replica sets and self-healing by replacing failed pods.

      MongoDB Database: I used a StatefulSet instead of a Deployment because databases typically require:

        1. Stable persistent storage/volume binding - ensure each pod keeps its data

        2. Stable network identity

        3. Ordered, graceful deployment and scaling which is ideal for stateful applications

The StatefulSet was paired with a PersistentVolumeClaim to ensure data is retained even if pods are restarted or rescheduled.

This approach aligns with best practices for managing stateful workloads on Kubernetes.

2. Method Used to Expose Pods to Internet Traffic
  To expose the application to internet traffic: 
    I used a LoadBalancer service type for the frontend pod. This provisioned an external IP address via GKE, which can be accessed publicly. e.g (type: LoadBalancer)

    The backend and database services were exposed internally using ClusterIP, as they are not meant to be accessed directly from the internet.

3. Use (or Lack) of Persistent Storage
  I implemented persistent storage for the MongoDB database:

    Used a PersistentVolumeClaim (PVC) to create and mount storage to the database pod in the StatefulSet. This ensures that the data remains intact even if the pod is deleted or restarted.
    The persistent volume is:
      1. Dynamically provisioned on GKE
      2. Bound to a specific MongoDB pod identity (mongo-0)
      3. Mounted at /data/db inside the MongoDB container.
    This architecture ensures data durability, isolation and scalability for the database layer.

No persistent storage was required for the frontend or backend as they are stateless and retrieve data via the backend.

4. Git Workflow Used
  The Git workflow used included: 
    1. Working on the main branch for simplicity during this small project.
    2. Commits were made frequently with descriptive messages, such as Add StatefulSet for database, Fix LoadBalancer service, and Update Docker image tags.
    3. Project structure and version control were maintained with .gitignore to exclude unnecessary files.

For team collaboration or CI/CD projects, I typically use Git Flow with main, dev, and feature branches.

5. Live Application & Debugging
  The application was successfully deployed on Google Kubernetes Engine. It is accessible via the following external IP:

    Live URL: (http://35.184.247.235:3000/)

      If any part of the deployment failed, I used the following debugging methods:

      kubectl logs [pod-name] to check application logs

      kubectl describe pod [pod-name] for lifecycle events

      kubectl get all to monitor resources and statuses

These tools helped identify issues such as container image pull errors and service misconfigurations.

6. Best Practices Followed
  Docker Image Tags: All images were tagged following the format:

    docker.io/fowino/yolo-client:v1.0.5
    docker.io/fowino/yolo-backend:v1.0.5

The deployment uses a robust and scalable architecture leveraging Kubernetes best practices:

  - Stateless services (frontend/backend) managed with Deployments

  - Stateful database with StatefulSet and PVC

  - Secure exposure through service types

  - Persistent storage to ensure data reliability

This setup demonstrates a real-world cloud-native architecture and is ready for further scalability, monitoring, and CI/CD integration.
