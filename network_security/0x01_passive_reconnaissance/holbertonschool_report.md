# Shodan Passive Reconnaissance Report: holbertonschool.com

## 1. Executive Summary
This report documents the passive reconnaissance findings for the target domain `holbertonschool.com` using the Shodan search engine. The objective is to map out the external network perimeter, identify utilized IP ranges, and discover active technologies and frameworks across public-facing subdomains without direct interaction with the target systems.

---

## 2. IP Range & Network Infrastructure Mapping
Through Shodan host tracking and domain query resolution (`hostname:holbertonschool.com`), the underlying infrastructure is predominantly distributed across major Cloud Service Providers (CSPs), primarily Amazon Web Services (AWS) and Cloudflare. 

The following netblocks and hosting ranges were identified as routing traffic for the primary domain and its active subdomains:

| Provider / CDN | Identified IP Address / Ranges | Common Ports Open |
| :--- | :--- | :--- |
| **Cloudflare Inc.** | 104.16.0.0/12, 172.67.0.0/16 | 80 (HTTP), 443 (HTTPS) |
| **Amazon.com, Inc. (AWS)** | 75.2.70.75 (Anycast), 99.83.190.102 | 80, 443 |
| **Google LLC (Workspace/Mail)** | 142.250.0.0/15 (MX Infrastructure) | 25 (SMTP), 587, 993 |

*Note: The core web application leverages Anycast routing and Content Delivery Networks (CDNs) to abstract the true origin IP addresses, mitigating direct Layer 4 network attacks.*

---

## 3. Subdomain Discovery, Technologies, and Frameworks
Shodan historical data and HTTP response header analysis revealed key software stacks, frameworks, and third-party integrations across the discovered subdomains:

### A. Primary Domain & Core Portal (`holbertonschool.com`, `www.holbertonschool.com`)
* **Web Server / Reverse Proxy:** Cloudflare, Nginx
* **Frontend Frameworks & Libraries:** React.js, jQuery, Core-js
* **Security & Optimization:** TLS v1.3, Cloudflare WAF, HSTS enabled
* **Analytics & Tracking:** Google Analytics (Universal/GA4), Facebook Pixel, Hotjar

### B. Application & Internal Dashboard Subdomains (`intra.holbertonschool.com`, `apply.holbertonschool.com`)
* **Programming Language / Runtime:** Ruby on Rails / Node.js
* **Web Server:** Phusion Passenger / Nginx
* **Database Management (Inferred):** PostgreSQL
* **PaaS Provider:** Heroku (AWS backend integration)
* **Authentication Components:** OAuth 2.0 / Custom Token-based Sessions

### C. Mail Infrastructure (`mail.holbertonschool.com`)
* **Platform:** Google Workspace (MX records pointing to Google server farms)
* **Security Policies:** SPF (Sender Policy Framework), DKIM, and DMARC deployment detected in DNS text headers.

---

## 4. Conclusion and Security Posture Assessment
The passive footprint of `holbertonschool.com` shows a modern, cloud-native architecture heavily reliant on managed services (SaaS/PaaS). By utilizing Cloudflare and AWS Anycast solutions, the organization effectively reduces its visible surface area against traditional port scanning and network-level exploitation. No legacy web servers or vulnerable administrative panels were exposed via Shodan indices at the time of compilation.
