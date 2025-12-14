# Inception
This project has been created as part of the 42 curriculum by bikourar.

# Description
Inception is a system administration project focused on building and managing a complete web infrastructure using Docker and Docker Compose. The objective is to deploy multiple services as isolated containers that work together to form a secure, scalable, and maintainable environment.

At the core of the infrastructure is a WordPress website powered by a MariaDB database, served through an NGINX reverse proxy configured with TLS encryption to ensure secure HTTPS communication. To improve performance, Redis is integrated as a caching layer.

In addition to the mandatory services, the project includes several bonus services such as an FTP server for file transfers, Adminer for database management, Portainer for container monitoring and administration, and a static website served through NGINX.

The main goal of this project is to gain hands-on experience with Docker containerization, service orchestration, container networking, and data persistence using volumes, while applying security best practices such as proper isolation, credential management, and encrypted communications.

# Instructions
## Prerequisites
<ol type="i">
    <li>Setup Machine on the Debian(Linux distribution)</li>
    <li> core tools Installed
        <ul>
            <li>Docker Software</li>
            <li>Docker Compose</li>
        </ul>
    </li>
    <li>tools help me
        <ul>
            <li>Vim text editor</li>
            <li>sudo privileges</li>
            <li>ssh for managing servers from host machine</li>
        </ul>
    </li>
</ol>

## Installation && configuration
```bash
git clone git@github.com:Bkourar/Inception.git
cd Inception
```
Efter this edit the Makefile and update the DATA_PATH variable so that it matches your home directory or preferred data storage location. Then, open srcs/docker-compose.yml and verify that all volume source paths reference this same directory. This ensures that Docker volumes are mounted correctly and that data persists across container restarts look more details in others files .md

## Building && Execution
Build and start all services. If a permission error occurs on Debian-based systems, run the commands with sudo.

```bash
make up        # starts your Docker application and all services in the YAML file.
make down      # Stops containers and removes containers, networks, volumes, and images
make restart   # Restart one or more containers
make clean     # Stop containers and remove unused Docker resources
make fclean    # Complete cleanup (removes all data)
make re        # Rebuild everything from scratch
make logs      # View container logs
make status    # Check container status
```


# Resources
<ol>
    <li>System Sources
        <ul>
            <li><a href="https://www.debian.org/distrib/">Obtenir Debian</a></li>
        </ul>
    </li>
    <li>Docker Sources
        <ul>
            <li><a href="https://docs.docker.com/">Docker Official Documentation</a></li>
            <li><a href="https://docs.docker.com/compose/">Docker Compose Documentation</a></li>
            <li><a href="https://docs.docker.com/develop/develop-images/dockerfile_best-practices/">Dockerfile Best Practices</a></li>
            <li><a href="https://docs.docker.com/network/">Docker Networking</a></li>
            <li><a href="https://docs.docker.com/storage/volumes/">Docker Volumes</a></li>
        </ul>
    </li>
    <li>Services Sources
        <ul>
            <li><a href="https://nginx.org/en/docs/">Nginx</a></li>
            <li><a href="https://wordpress.org/support/">WordPress</a></li>
            <li><a href="https://mariadb.com/docs/">MariaDB</a></li>
            <li><a href="https://redis.io/docs/latest/">Redis</a></li>
            <li><a href="https://docs.rockylinux.org/10/guides/file_sharing/secure_ftp_server_vsftpd/">vsftpd</a></li>
            <li><a href="https://www.adminer.org/">Adminer</a></li>
            <li><a href="https://docs.portainer.io/">Portainer</a></li>
        </ul>
    </li>
    <li>Others Sources
        <ul>
            <li><a href="https://developer.wordpress.org/cli/commands/">WP-CLI Commands</a></li>
            <li><a href="https://blog.sucuri.net/2022/11/wp-cli-how-to-install-wordpress-via-ssh.html">Installing WordPress via WP-CLI (SSH)</a></li>
              <li><a href="https://docs.docker.com/engine/security/">Docker Security Documentation</a></li>
            <li><a href="https://www.sysdig.com/learn-cloud-native/what-are-container-runtimes">Container Runtimes Explained</a></li>
            <li><a href="https://www.freecodecamp.org/news/build-your-on-custom-container-without-docker/#heading-what-is-a-cri-container-runtime-interface">Container Runtime Interface (CRI)</a></li>
            <li><a href="https://www.freecodecamp.org/news/build-your-on-custom-container-without-docker/">Building a Container Without Docker</a></li>
            <li><a href="https://rebrowser.net/glossary/process-isolation">Process Isolation</a></li>
            <li><a href="https://sites.cs.ucsb.edu/~rich/class/cs293b-cloud/notes/Virtualization/virtualization.html">Virtualization Concepts</a></li>
            <li><a href="https://fiveable.me/cloud-computing-architecture/unit-2/virtualization-technologies-hypervisors-containers/study-guide/AYvDnkutISCCyIir">Hypervisors vs Containers</a></li>
            <li><a href="https://eureka.patsnap.com/article/architecture-of-a-hypervisor-and-how-it-isolates-vms">Hypervisor Architecture</a></li>
            <li><a href="https://www.researchgate.net/figure/System-architecture-The-bottom-block-depicts-the-hardware-layer-with-which-RTXI_fig2_317276212">System Architecture Diagram</a></li>
            <li><a href="https://cs61.seas.harvard.edu/wiki/2017/Kernel2/">Kernel Architecture</a></li>
            <li><a href="https://fastcgi-archives.github.io/FastCGI_A_High-Performance_Web_Server_Interface_FastCGI.html">FastCGI Interface</a></li>
            <li><a href="https://www.digitalocean.com/community/tutorials/php-fpm-nginx">PHP-FPM with NGINX</a></li>
            <li><a href="https://kinsta.com/blog/reverse-proxy/">Reverse Proxy Explained</a></li>
            <li><a href="https://mariadb.com/kb/en/documentation/">MariaDB Documentation</a></li>
            <li><a href="https://redis.io/documentation">Redis Documentation</a></li>
            <li><a href="https://medium.com/@weidagang/linux-beyond-the-basics-chroot-f831b20c93d7">Linux chroot Explained</a></li>
            <li><a href="https://tuto.grademe.fr/inception/#">Inception Project Guide</a></li>
            <li><a href="https://youtu.be/r1nJT63BFQ0">Inception Video Tutorial</a></li>
        </ul>
    </li>
</ol>

# AI Usage
Artificial Intelligence tools were used during the development of this project to assist with a limited number of supporting tasks. Their role was to help improve clarity, correctness, and reliability, while all core design decisions and implementations were made by bikourar.
<ul>
<li>Configuration debugging
AI tools were used to help analyze and troubleshoot configuration files during development. This included identifying syntax errors and misconfigurations in vsftpd.conf, particularly related to passive mode settings and seccomp sandbox restrictions, as well as diagnosing upstream connection issues in nginx.conf. The goal was to understand error messages faster and apply correct fixes, while the final configurations were manually validated and tested.</li>
<li>Compatibility checks
AI assistance was used to investigate unexpected runtime errors related to Portainer. Through version comparison and documentation analysis, it helped identify an incompatibility between the latest Portainer client and the Docker Engine version provided on the 42 virtual machine.</li>
<li>AI was used as a writing aid to help organize and draft the initial structure of the project documentation (README.md, USER_DOC.md, and DEV_DOC.md). This support focused on improving clarity, formatting, and compliance with the subject requirements (Chapters VI and VII)</li>
<li>Startup script improvements
AI assistance helped review and refine the start.sh initialization scripts for WordPress and MariaDB. This included improving the order of operations, handling edge cases (such as existing databases or users), and adding basic error-handling logic to ensure services start reliably inside their containers.</li>
</ul>

# Project (Description && Design)
This project was designed with a strong focus on isolation, security, performance, and maintainability. The following sections explain the main technical choices made during development, along with a comparison of alternative approaches.
### Virtual Machines vs Docker
<ul>
<li>Virtual Machines (VMs) virtualize an entire hardware stack, including their own kernel and operating system. Each VM runs a full OS, which makes them heavy in terms of resource usage, slower to start, and more complex to manage at scale.</li>
<li>Docker, on the other hand, relies on OS-level virtualization. Containers share the host operating system kernel while running in isolated user spaces. This approach significantly reduces overhead, allows containers to start almost instantly, and makes resource usage more efficient.</li>
<li>Design choice:
Docker was chosen for this project because it provides strong service isolation while remaining lightweight, fast, and portable. This makes it ideal for deploying multiple interconnected services (NGINX, WordPress, MariaDB, Redis, etc.) on a single host, which is the core objective of the Inception project.</li>
</ul>

### Secrets vs Environment Variables
<ul>
<li>Environment variables are commonly used to configure applications and are easy to manage. However, they can expose sensitive information if misused, for example through commands like docker inspect, and they are often stored in plain text inside .env files.</li>
<li>Docker Secrets offer a more secure solution for handling sensitive data such as passwords and private keys. Secrets are encrypted at rest and are only made available to containers that explicitly require them, reducing the risk of accidental exposure.</li>
<li>Design choice:
For this project, environment variables stored in a .env file are used for configuration simplicity, as allowed by the subject. Security best practices are still followed by ensuring that credentials are never hardcoded in Dockerfiles or source code, and by limiting access to configuration files. This approach balances security and simplicity while remaining compliant with project requirements.</li>
</ul>

### Docker Network vs Host Network
<ul>
<li>Using the host network means that containers share the host’s network namespace. In this mode, there is no network isolation: if a container listens on a port (for example, port 80), that port is directly exposed on the host. This can lead to port conflicts and reduced security.</li>
<li>With a Docker bridge network, containers are placed inside an isolated virtual network. They can communicate with each other using service names via Docker’s internal DNS, while only explicitly exposed ports are accessible from the host.</li>
<li>Design choice:
This project uses a custom Docker bridge network (inception) to isolate the infrastructure. Internal services (such as WordPress communicating with MariaDB on port 3306 or Redis on port 6379) are only accessible within the network. Only essential entry points—such as NGINX over HTTPS (443) and FTP (21)—are exposed to the host, improving both security and clarity of the architecture.</li>
</ul>

### Docker Volumes vs Bind Mounts
<ul>
<li>Docker volumes are managed entirely by Docker and stored in a dedicated area of the host filesystem (typically /var/lib/docker/volumes). They are portable, easy to back up, and independent of the host’s directory structure</li>
<li>Bind mounts map a specific directory from the host machine directly into a container. While they depend on the host’s filesystem layout, they provide precise control over where data is stored.</li>
<li>Design choice:
This project uses bind mounts defined in docker-compose.yml, pointing to a directory such as /home/${USER}/data. This choice was made to comply with the subject requirement that persistent data must be stored in a specific and clearly identifiable location on the host machine. Bind mounts ensure data persistence across container rebuilds while giving the user full visibility and control over stored files.</li>
</ul>

### Architecture Flow

```text

Client → NGINX (HTTPS) → WordPress → MariaDB
                         ↓
                       Redis

```