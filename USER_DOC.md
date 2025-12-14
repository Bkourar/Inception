# User Documentation

## Overview

This project provides a complete and secure web hosting infrastructure using Docker containers.  
All services run in isolation and communicate through a private Docker network.

The stack includes:

- **WordPress** — Main website served over HTTPS
- **MariaDB** — Database storing WordPress data
- **Redis** — Cache layer to improve WordPress performance
- **Adminer** — Web interface to manage the database
- **FTP Server** — File transfer access to WordPress files
- **Portainer** — Web interface to monitor and manage containers
- **Static Website** — Bonus static HTML/CSS website

All external connections are secured using TLS/SSL encryption.

---

## Prerequisites

Before using the services, ensure that:

- The project is fully set up and running (`make up`)
- Docker and Docker Compose are installed
- You have terminal or SSH access to the server
- The required domains are configured in `/etc/hosts`
- Credentials are properly defined in the environment or secrets files

Refer to **DEV_DOC.md** for installation and configuration details.

---

## Starting and Stopping the Project

All commands must be executed from the root of the repository.

### Start the project

```bash
make up
```
This command:
Builds Docker images
Creates networks and volumes
Starts all containers

Stop the project:
```bash
make down
```
Stops all containers without deleting data.

Restart services:
```bash
make restart
```

## Accessing the Services

<table>
    <thead>
        <tr>
            <th>Service</th>
            <th>URL / Command</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong>WordPress</strong></td>
            <td><code>https://&lt;login&gt;.42.fr</code></td>
            <td>Main WordPress website</td>
        </tr>
        <tr>
            <td><strong>WordPress Admin</strong></td>
            <td><code>https://&lt;login&gt;.42.fr/wp-admin</code></td>
            <td>Administration dashboard for managing content and users</td>
        </tr>
        <tr>
            <td><strong>Adminer</strong></td>
            <td><code>https://adminer.&lt;login&gt;.42.fr</code></td>
            <td>Web interface for managing the MariaDB database</td>
        </tr>
        <tr>
            <td><strong>Portainer</strong></td>
            <td><code>https://portainer.&lt;login&gt;.42.fr</code></td>
            <td>Docker container monitoring and management interface</td>
        </tr>
        <tr>
            <td><strong>Static Website</strong></td>
            <td><code>https://static.&lt;login&gt;.42.fr</code></td>
            <td>Bonus static HTML/CSS website</td>
        </tr>
        <tr>
            <td><strong>FTP Server</strong></td>
            <td><code>lftp -u &lt;user&gt;,&lt;pass&gt; 127.0.0.1</code></td>
            <td>FTP access to WordPress files</td>
        </tr>
    </tbody>
</table>

## Usage and Manging

### WordPress Usage
<ul>
    <li>
        <strong>Access the Admin Dashboard</strong>
        <ul>
            <li>Open your browser</li>
            <li>Go to:
                <code>https://&lt;login&gt;.42.fr/wp-admin</code>
            </li>
            <li>Enter your administrator username and password</li>
            <li>Click <strong>Log In</strong></li>
        </ul>
    </li>
    <li>
        <strong>Main Features</strong>
        <ul>
            <li>Create, edit, and delete posts and pages</li>
            <li>Upload and manage media files (images, videos, documents)</li>
            <li>Customize the website appearance using themes</li>
            <li>Extend functionality by installing plugins</li>
            <li>Manage users and assign roles (admin, author, etc.)</li>
        </ul>
    </li>
    <li>
        <strong>Content Management</strong>
        <ul>
            <li>Posts: Used for blog-style content</li>
            <li>Pages: Used for static content (About, Contact, etc.)</li>
            <li>Media Library: Stores uploaded files</li>
        </ul>
    </li>
    <li>
        <strong>Updates</strong>
        <ul>
            <li>Log in to the WordPress admin panel</li>
            <li>Navigate to <em>Dashboard → Updates</em></li>
            <li>Update WordPress core, themes, and plugins</li>
        </ul>
    </li>
    <li>
        <strong>Security Notes</strong>
        <ul>
            <li>Use strong passwords for all user accounts</li>
            <li>Limit administrator access to trusted users only</li>
            <li>Always update plugins and themes to reduce security risks</li>
        </ul>
    </li>
</ul>

### FTP Server Usage
<ul>
    <li>
        <strong>Connection Details</strong>
        <ul>
            <li>Host: <code>localhost</code> or your server IP</li>
            <li>Port: <code>21</code></li>
            <li>Protocol: FTP</li>
            <li>Username: <code>ftpuser</code></li>
            <li>Password: Located in <code>secrets/ftp_pass.txt</code></li>
        </ul>
    </li>
    <li>
        <strong>Purpose</strong>
        <ul>
            <li>Upload files directly to your WordPress installation</li>
            <li>Download files from your WordPress installation</li>
        </ul>
    </li>
    <li>
        <strong>Recommended FTP Clients</strong>
        <ul>
            <li>lftp (command-line FTP client)</li>
            <li>FileZilla (GUI client)</li>
            <li>WinSCP (Windows GUI client)</li>
        </ul>
    </li>
    <li>
        <strong>Connection Steps (using CLI)</strong>
        <ul>
            <li>Open your terminal or FTP client</li>
            <li>Connect using:
                <code>lftp -u &lt;ftpuser&gt;,&lt;password&gt; &lt;server_ip&gt;</code>
            </li>
            <li>Navigate to the WordPress directory: <code>/var/www/html</code></li>
            <li>Upload or download files as needed</li>
        </ul>
    </li>
    <li>
        <strong>Security Notes</strong>
        <ul>
            <li>Always use secure passwords</li>
            <li>Do not expose FTP credentials publicly</li>
            <li>Prefer SFTP if available for encrypted transfers</li>
        </ul>
    </li>
</ul>

### Database Management (Adminer)
<ul>
    <li>
        <strong>URL:</strong> <code>https://adminer.sessarhi.42.fr</code>
    </li>
    <li>
        <strong>Purpose:</strong>
        <ul>
            <li>Manage your WordPress database directly</li>
            <li>View database tables and structure</li>
            <li>Run SQL queries</li>
            <li>Export and import database backups</li>
            <li>Modify table structures</li>
        </ul>
    </li>
    <li>
        <strong>Login Credentials:</strong>
        <ul>
            <li>System: MySQL</li>
            <li>Server: <code>mariadb</code></li>
            <li>Username: <code>sessarhi</code></li>
            <li>Password: Located in <code>secrets/db_password.txt</code></li>
            <li>Database: <code>wordpress</code></li>
        </ul>
    </li>
    <li>
        <strong>Caution:</strong>
        <ul>
            <li>Be careful when modifying the database directly</li>
            <li>Always backup before making changes</li>
        </ul>
    </li>
</ul>

### Checking Service Status
Using Makefile:
```bash
make status
```
All containers should be marked as Up or healthy.

Viewing Logs:
```bash
make logs
```
Or for a specific service:
```bash
docker logs nginx
docker logs wordpress
docker logs mariadb
```
## Troubleshooting
Check container status:
```bash
make status
```
Restart services:
```bash
make restart
```
Check NGINX logs:
```bash
docker logs nginx
```
Database Errors:
Verify MariaDB container is running
Check credentials
Inspect database logs
```bash
docker logs mariadb
```
SSL Warning in Browser
This project uses self-signed certificates.
Browser warnings are expected.