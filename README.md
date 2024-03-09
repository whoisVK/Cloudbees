## Requirements

To run this project, you will need:

-Docker
-Docker Compose
-Make
-curl or wget (for testing)

## Getting Started

### Clone the Repository
Clone this repository to your local machine to get started.

```shell
git clone <repository-url>
cd <repository-directory>
```

## Build and run the container
### Build the container

```shell
make build
```
This command builds the Docker image with Nginx configured to serve the static content.


### Start the service

```shell
make up
```
This command starts the Docker container in the background. Nginx serves on port 8888, and logs are stored in a Docker volume.

### Accessing the Service
To verify the service is running, use:

```shell
curl http://127.0.0.1:8888
```

### Stopping the Service
To stop and remove the Docker container, use:

```shell
make down
```

## Assumptions made

-Nginx serves as the front-end server due to its efficiency and ease of configuration for serving static content.

-Docker Compose facilitates managing multi-container Docker applications

-A Makefile is included to simplify the build and management commands, enhancing the user experience.