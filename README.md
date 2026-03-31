# debug-container

This repository contains a Dockerfile and a GitHub Actions workflow to build and push a lightweight debugging container image to Docker Hub.

The image is based on Alpine Linux and includes various common debugging and networking tools, making it ideal for troubleshooting issues in containerized environments (like Kubernetes or Docker Swarm).

## Image details

The image is built and pushed to: `gsergey418/dbg:latest`

### Included Tools

*   **Networking:** `curl`, `wget`, `bind-tools` (dig, nslookup), `iproute2`, `iputils` (ping), `net-tools` (netstat), `nmap`, `tcpdump`, `tshark`
*   **System/Process:** `strace`, `sysstat`, `lsof`, `procps` (ps), `htop`
*   **Text/Data Processing:** `jq`, `less`, `vim`
*   **Other:** `bash`, `git`, `openssl`, `ca-certificates`

## Usage

You can pull and run this image in your environment to debug network connectivity, inspect processes, or execute arbitrary commands.

**Docker:**
```bash
docker run -it --rm gsergey418/dbg:latest bash
```

**Kubernetes:**
```bash
kubectl run dbg --image=gsergey418/dbg:latest -it --rm --restart=Never -- bash
```

## GitHub Actions

The provided GitHub Actions workflow `.github/workflows/docker-build-push.yml` automatically builds the Docker image and pushes it to Docker Hub on every push to the `main` or `master` branch.

### Prerequisites

To use the GitHub Actions workflow, you need to configure the following secrets in your GitHub repository:

*   `DOCKERHUB_USERNAME`: Your Docker Hub username (`gsergey418`).
*   `DOCKERHUB_TOKEN`: A personal access token for Docker Hub with read/write permissions.
