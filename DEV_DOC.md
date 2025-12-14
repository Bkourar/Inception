# Developer Documentation

This document is intended for developers who want to understand, build, modify, and maintain the Inception project infrastructure.

---

## Environment Setup

### Prerequisites

The project must be built on a **Linux system (Debian recommended)**.

Required tools:
- Docker Engine
- Docker Compose (v2)
- Make
- Git
- sudo privileges

Verify installation:
```bash
docker --version
docker compose version
make --version
```
### configuration

Hostname Configuration:
Add project domains to /etc/hosts (replace login with your 42 username):
```bash
sudo nano /etc/hosts
127.0.0.1 login.42.fr adminer.login.42.fr portainer.login.42.fr static.login.42.fr
```
Environment Variables (.env):
```bash
srcs/.env
# Database
MYSQL_DATABASE=wordpress
MYSQL_USER=wp_user
MYSQL_HOST=mariadb

# WordPress
DOMAIN_NAME=login.42.fr

# FTP
FTP_USER=ftpuser
.
.
.
```
Persistent Data Path:
example
<ol type="1">
<li>Choose a directory on your system

```bash
/home/username/data
```
</li>
<li>Update the Makefile

    ```vim
        DATA_PATH=/home/username/data
    ```
</li>
    <li>Verify Docker Compose volume paths
        <ul>
            <li>Open srcs/docker-compose.yml and ensure that all volume source paths use the same DATA_PATH directory.
            </li>
        </ul>
    </li>
</ol>

## Directory Structure
```text
inception/
├── Makefile
├── README.md
├── USER_DOC.md
├── DEV_DOC.md
├── secrets/
└── srcs/
    ├── .env
    ├── docker-compose.yml
    └── requirements/
        ├── nginx/
        ├── wordpress/
        ├── mariadb/
        └── bonus/
            ├── redis/
            ├── ftp/
            ├── adminer/
            ├── portainer/
            └── static-site/
```
## Build and Launch
### Using Makefile (Recommended)
```bash
make up        # Build and start all services
make down      # Stop containers
make restart   # Restart services
make logs      # Show logs
make status    # Container status
make clean     # Remove unused resources
make fclean    # Full cleanup (deletes data)
make re        # Rebuild from scratch
```
### Using Docker Compose Directly
```bash
cd srcs
docker compose build
docker compose up -d
docker compose down
```

## Container Management

```bash
docker ps
docker ps -a
docker logs <container>
docker exec -it <container> sh
docker inspect <container>
```

## Data Persistence

### Host Data Locations:
<table>
    <thead>
        <tr>
            <th>Service</th>
            <th>Host Path</th>
            <th>Container Path</th>
            <th>Purpose</th>
            <th>Persistence Behavior</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong>MariaDB</strong></td>
            <td>/home/${USER}/data/wordpress-files</td>
            <td>/var/lib/mysql</td>
            <td>Stores WordPress database files</td>
            <td>Data persists across container restarts and rebuilds</td>
        </tr>
        <tr>
            <td><strong>WordPress</strong></td>
            <td>/home/${USER}/data/database-files</td>
            <td>/var/www/html</td>
            <td>Stores WordPress core, themes, plugins, uploads</td>
            <td>Website content remains intact after container removal</td>
        </tr>
    </tbody>
</table>

Data is deleted only with:
```bash
make fclean
```
## Network Management

A custom Docker bridge network is used:
```bash
inception
```
Inspect network:
```bash
docker network inspect inception
```
Service communication is done via service names:
```bash
ping mariadb
ping redis
```
## 9. Service Responsibilities

<ul>
    <li>
        <strong>NGINX</strong>
        <ul>
            <li>Acts as the single entry point to the infrastructure</li>
            <li>Handles HTTPS traffic using TLS encryption</li>
            <li>Functions as a reverse proxy for backend services</li>
            <li>Forwards PHP requests to WordPress via FastCGI</li>
            <li>Serves multiple virtual hosts (WordPress, Adminer, Static site)</li>
            <li>Exposes only port <strong>443</strong> to the host</li>
        </ul>
    </li>
    <li>
        <strong>WordPress</strong>
        <ul>
            <li>Runs WordPress using PHP-FPM</li>
            <li>Uses WP-CLI for automated installation and configuration</li>
            <li>Connects to MariaDB for data storage</li>
            <li>Integrates Redis for caching to improve performance</li>
            <li>Stores WordPress files on a persistent bind mount</li>
        </ul>
    </li>
    <li>
        <strong>MariaDB</strong>
        <ul>
            <li>Provides the relational database backend for WordPress</li>
            <li>Stores all WordPress content and configuration data</li>
            <li>Uses persistent storage via bind mounts</li>
            <li>Accessible only within the Docker network</li>
        </ul>
    </li>
    <li>
        <strong>Redis</strong>
        <ul>
            <li>Acts as an in-memory cache for WordPress</li>
            <li>Reduces database queries and improves response time</li>
            <li>Communicates only with WordPress inside the Docker network</li>
        </ul>
    </li>
    <li>
        <strong>FTP (vsftpd)</strong>
        <ul>
            <li>Provides file transfer access to WordPress files</li>
            <li>Uses chroot jail for security</li>
            <li>Operates in passive mode</li>
            <li>Shares the WordPress data directory via bind mount</li>
            <li>Exposes port <strong>21</strong> to the host</li>
        </ul>
    </li>
    <li>
        <strong>Adminer</strong>
        <ul>
            <li>Provides a web-based database management interface</li>
            <li>Allows inspection and management of MariaDB databases</li>
            <li>Accessible through a dedicated subdomain</li>
        </ul>
    </li>
    <li>
        <strong>Portainer</strong>
        <ul>
            <li>Provides a graphical interface for Docker management</li>
            <li>Allows monitoring of containers, images, networks, and volumes</li>
            <li>Uses persistent storage to retain configuration data</li>
            <li>Accessible via HTTPS on port <strong>9443</strong></li>
        </ul>
    </li>
    <li>
        <strong>Static Website</strong>
        <ul>
            <li>Serves static HTML/CSS content using NGINX</li>
            <li>Demonstrates hosting of non-PHP content</li>
            <li>Runs in an isolated container within the Docker network</li>
        </ul>
    </li>
</ul>

## Rebuild & Recovery

If containers break:
```bash
make down
docker system prune -af
make build
```