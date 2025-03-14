# Cloud Engineering Pathway Assessment

## Introduction

In this project, I will containerize a full-stack To-Do List application that follows a 3-tier architecture: Frontend, Backend, and Database. The goal of this exercise is to ensure that the application runs securely, efficiently, and consistently across different environments by using Docker and Docker Compose.

This documentation provides the necessary instructions to build, run, and manage the Dockerized containers for each component of the MERN stack (MongoDB, Express, React, Node.js) application.

## Objective

The objectives of this project are as follows:

- Containerize each component of the 3-tier architecture (Frontend, Backend, Database) using Docker.
- Provide a summary of the `docker-compose.yml` file used to orchestrate the setup of the three containers.
- Ensure smooth communication between the containers and provide necessary network and security configurations.
- Create clear setup instructions for building, running, and managing the Docker containers.
- Offer a troubleshooting guide to resolve common issues.

## Procedure (Methodology)

### Prerequisites

Before running the application, make sure you have the following installed:

- Docker
- Git

The procedure for containerizing the 3-tier MERN stack To-Do List application involves several steps:

### Step 1: Clone the Repository

First, I need to clone the repository containing the MERN stack application.

```bash
git clone https://github.com/icnoka/fullstack-todo-list.git
cd fullstack-todo-list
```

This step downloads the application's code to my local environment so I can begin the process of containerization.

### Step 2: Dockerizing the Components

After cloning the repository, I need to containerize each component of the application: the Frontend, Backend, and Database.

#### Frontend - Dockerfile

A `Dockerfile` is created for the React-based frontend to define the environment and process required to build and serve the frontend application.

- The `Dockerfile` uses the `node` image to build the React application.
- Once the application is built, the second stage uses `nginx` to serve the production build.

#### Backend - Dockerfile

Similarly, a `Dockerfile` is written for the Node.js and Express backend. The backend is containerized using the `node` image.

- The `Dockerfile` installs the backend dependencies and starts the server.

#### Database - Dockerfile

For MongoDB, I use the official MongoDB Docker image. Since MongoDB does not require any custom setup, I rely on the pre-built Docker image for MongoDB in the `docker-compose.yml` file to configure it.

### Step 3: Docker Compose

Once the Dockerfiles are ready, I use `docker-compose` to define and manage the containers. Docker Compose helps to:

- Orchestrate the setup of the containers for the Frontend, Backend, and Database components.
- Ensure smooth communication between the containers using Docker networking features.
- Manage dependencies between the services, such as the Backend depending on the Database, and the Frontend depending on the Backend.

The `docker-compose.yml` file is used to define each service (Frontend, Backend, and Database), configure networking, volumes, and exposed ports, and set up necessary environment variables for the application to run.

## Setup Instructions

### 4.1 Building and Running the Containers

To build and start the containers, run:

```bash
docker-compose up --build -d
```

This command will:

- Build the Docker images for the frontend, backend, and database.
- Start the containers in detached mode.

### 4.2 Stopping the Containers

To stop and remove the containers, use:

```bash
docker-compose down
```

### 4.3 Verifying the Setup

Check if all containers are running:

```bash
docker ps
```

Access the application at the following URLs:

- Frontend: [http://localhost:3000](http://localhost:3000)
- Backend: [http://localhost:5000](http://localhost:5000)
- MongoDB: [http://localhost:27017](http://localhost:27017) 

## Network Configurations

The containers are configured to communicate through a custom Docker network (`app_network`), which is automatically created by Docker Compose. This ensures that the services can talk to each other securely.

- The Frontend communicates with the Backend via HTTP on port `5000`.
- The Backend communicates with the Database (MongoDB) through the default MongoDB port (`27017`).

## Troubleshooting Guide

Some common issues you may encounter during the Docker setup include:

1. **Containers not starting:**
   - **Solution:** Run `docker-compose logs` to check for errors.

2. **Ports already in use:**
   - **Solution:** If a port conflict occurs, stop any conflicting processes or change the ports in the Docker configuration.
     
     ```bash
     # Check for processes using a port
     sudo lsof -i :3000
     
     # Kill the process
     kill -9 <PID>
     ```

3. **Application not accessible:**
   - **Solution:** Ensure the containers are running with `docker ps`, or restart containers with `docker-compose restart`.

## Container Testing Script

To verify if all services are running correctly, a `test.sh` script is used. This script checks the accessibility of the backend, database, and ensures all containers are running smoothly.

To execute the test script, use the following commands:

1. Give the script execute permissions:

   ```bash
   chmod +x test_containers.sh
   ```

2. Run the script:

   ```bash
   ./test_containers.sh
   ```

This script verifies:

- The backend service is reachable.
- The MongoDB database is accessible.
- All containers are running correctly.

## Conclusion

This documentation outlines the complete setup and configuration for containerizing a MERN stack To-Do List application using Docker. By Dockerizing the components and orchestrating them with Docker Compose, I ensure the application is portable, scalable, and easy to deploy across different environments. The process covers cloning the repository, writing the Dockerfiles for the Frontend, Backend, and Database components, and using Docker Compose for orchestration. Additionally, network and security configurations are carefully set up to maintain a secure and efficient environment for the application.
