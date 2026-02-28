<div align="center">

# 🐳 inception

**A Docker infrastructure with WordPress, NGINX, and MariaDB — fully orchestrated.**

![Docker](https://img.shields.io/badge/tool-Docker-blue?style=for-the-badge&logo=docker)
![42](https://img.shields.io/badge/school-42-black?style=for-the-badge)
![Score](https://img.shields.io/badge/score-100%2F100-brightgreen?style=for-the-badge)

</div>

---

## 🧠 What is inception?

`inception` is a 42 DevOps project where you set up a complete **multi-container infrastructure** using **Docker** and **Docker Compose**. Each service runs in its own container, communicates over a custom network, and stores persistent data in named volumes.

No pre-built images (except Alpine/Debian base). Everything is hand-crafted.

---

## 🏗️ Infrastructure

```
                    ┌─────────────────────────────────────┐
                    │           Docker Network             │
                    │                                      │
Internet ──HTTPS──▶ │  [NGINX:443]──▶[WordPress:9000]    │
                    │                      │               │
                    │              [MariaDB:3306]          │
                    │                                      │
                    │  Volumes: wordpress_data, db_data    │
                    └─────────────────────────────────────┘
```

---

## 📦 Services

### 🔷 NGINX
- **Reverse proxy** with TLS (SSL/TLS v1.2 or v1.3 only)
- Only entry point into the infrastructure
- Self-signed certificate (or Let's Encrypt)
- Serves WordPress via FastCGI proxy to port 9000

### 🟦 WordPress + PHP-FPM
- WordPress installed and configured automatically
- PHP-FPM runs without NGINX in the same container
- Connected to MariaDB for the database

### 🟩 MariaDB
- Database backend for WordPress
- Custom root password, dedicated WP user
- Data persisted via Docker volume

---

## 🚀 Setup

```bash
git clone https://github.com/Houdaifa1/inception
cd inception
```

Edit `.env` with your credentials:

```env
DOMAIN_NAME=houdaifa.42.fr
MYSQL_ROOT_PASSWORD=supersecret
MYSQL_DATABASE=wordpress
MYSQL_USER=wp_user
MYSQL_PASSWORD=wp_password
WP_ADMIN_USER=admin
WP_ADMIN_PASS=admin_pass
WP_ADMIN_EMAIL=admin@example.com
```

Launch everything:

```bash
make
# Equivalent to: docker-compose up --build -d
```

Visit `https://houdaifa.42.fr` in your browser.

---

## 🔧 Makefile

```bash
make        # Build and start all containers
make down   # Stop and remove containers
make clean  # Remove containers, volumes, and images
make re     # Full rebuild
make logs   # View all container logs
```

---

## 📁 Structure

```
inception/
├── srcs/
│   ├── docker-compose.yml
│   ├── .env
│   └── requirements/
│       ├── nginx/
│       │   ├── Dockerfile
│       │   └── conf/nginx.conf
│       ├── wordpress/
│       │   ├── Dockerfile
│       │   └── tools/wp-setup.sh
│       └── mariadb/
│           ├── Dockerfile
│           └── tools/db-init.sh
└── Makefile
```

---

<div align="center">
<i>Infrastructure as code. Containers all the way down.</i>
</div>
