Yolo E-commerce — Kubernetes Deployment on GKE

    Yolo is a containerized multi-tier application demonstrating the use of Docker, Kubernetes, and Google Kubernetes Engine (GKE) for orchestration and scaling. 
    
    This project has been built as part of the Week 5 Independent Project for the Kubernetes module.

Live Deployment

live App URL: (http://35.184.247.235:3000/)

Tech Stack

    - Frontend: HTML/CSS/JavaScript (served via Node.js Express)

    - Backend: Node.js

    - Database: MongoDB

    - Containerization: Docker

    - Orchestration: Kubernetes (GKE)

    - CI/CD: Git & GitHub

Project Structure

yolo/

├── backend/

│   ├── Dockerfile

│   └── index.js

├── client/

│   ├── Dockerfile

│   └── index.html

├── manifests/

│   ├── backend-deployment.yaml

│   ├── backend-service.yaml

│   ├── frontend-deployment.yaml

│   ├── frontend-service.yaml

│   ├── mongo-statefulset.yaml

│   ├── mongo-service.yaml

│   └── mongo-pvc.yaml

├── .gitignore

├── README.md

└── explanation.md

Kubernetes Components

    1. Frontend

        Containerized with Docker and deployed using a Kubernetes Deployment.

        Exposed to the internet using a LoadBalancer Service.

        Image: fowino/yolo-client:v1.0.5

    2. Backend

        Node.js API containerized and deployed via a Deployment.

        Exposed internally via a ClusterIP service.

        Image: fowino/yolo-backend:v1.0.5

    3. Database

        MongoDB deployed as a StatefulSet to preserve identity and data.

        Storage provided via a PersistentVolumeClaim (PVC).

        Internal-only access via a ClusterIP service.

    4. Deploy on GKE

        Authenticate and create GKE cluster:

            gcloud auth login

            gcloud config set project <your-gcp-project-id>

            gcloud container clusters create yolo-cluster --zone <your-zone>

            gcloud container clusters get-credentials yolo-cluster --zone <your-zone>

    5. Deploy all manifests:

            kubectl apply -f manifests/

    6. Get frontend external IP:

            kubectl get svc

Docker Images

    Frontend: fowino/yolo-client:v1.0.5

    Backend: fowino/yolo-backend:v1.0.5

Tagging follows the convention:
    
    docker.io/fowino/<component>:v1.0.5

Related Docs

Explanation.md: Technical and architectural rationale.

👤 Author

Fredrick Owino

GitHub: @fredmara

✅ Status

✔️ Project deployed to GKE

🛡️ Stateful database with persistent storage

📦 Docker images pushed to Docker Hub

📎 See above for deployment IP and live URL