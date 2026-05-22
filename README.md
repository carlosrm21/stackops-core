# 🚀 StackOps-Core

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Docker Support](https://img.shields.io/badge/Docker-Supported-blue?logo=docker&logoColor=white)](https://www.docker.com/)
[![Security: Strict](https://img.shields.io/badge/Security-Strict-success?logo=guardsquare&logoColor=white)](https://securityheaders.com/)

**StackOps-Core** es un ecosistema de infraestructura *Self-Hosted* open-source diseñado para desarrolladores, agencias y startups que quieren migrar de plataformas PaaS costosas (como Vercel o Heroku) hacia sus propios servidores (VPS o hardware local) sin perder la facilidad de un despliegue en un clic, garantizando un rendimiento extremo y seguridad de nivel empresarial.

<p align="center">
  <img src="https://raw.githubusercontent.com/tandpfun/skill-icons/main/icons/Docker.svg" width="50" alt="Docker" />
  <img src="https://raw.githubusercontent.com/tandpfun/skill-icons/main/icons/Linux.svg" width="50" alt="Linux" />
  <img src="https://raw.githubusercontent.com/tandpfun/skill-icons/main/icons/Redis.svg" width="50" alt="Redis" />
  <img src="https://raw.githubusercontent.com/tandpfun/skill-icons/main/icons/Caddy.svg" width="50" alt="Caddy" />
</p>

---

## 🔥 Características Principales

* **⚡ Velocidad Absurda (HTTP/3 & Zstd):** Proxy inverso basado en **Caddy** con soporte nativo para HTTP/3 (QUIC) y compresión agresiva Zstandard, garantizando una carga instantánea y puntajes de **100/100 en Core Web Vitals**.
* **🔒 Seguridad por Defecto (Grado A+):** Cabeceras de seguridad estrictas preconfiguradas (`X-Frame-Options`, `HSTS`, `X-Content-Type-Options`) y deshabilitación de firmas del servidor.
* **🛠️ Blindaje del Sistema:** Incluye un script de automatización que optimiza el Kernel de Linux para soportar conexiones masivas y configura un cortafuegos (UFW) con protección contra fuerza bruta vía `Fail2Ban`.
* **📦 Entornos Listos para Producción:** Módulo preconfigurado de Node.js aislado con una capa de caché de ultra-alto rendimiento en **Redis** optimizada en el uso de memoria RAM.
* **💾 Respaldos Automatizados:** Script inteligente para snapshots diarios automáticos de bases de datos y archivos con política de rotación y limpieza.

---

## 🚀 Guía de Instalación Rápida (3 Pasos)

Sigue estos pasos en tu servidor limpio (Ubuntu recomendado):

### Paso 1: Blindar el Servidor
Clona el repositorio, dale permisos de ejecución al script de seguridad y ejecútalo como root:

```bash
git clone [https://github.com/carlosrm21/stackops-core.git](https://github.com/carlosrm21/stackops-core.git)
cd stackops-core
chmod +x scripts/*.sh
sudo ./scripts/setup-firewall.sh
