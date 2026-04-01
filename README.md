# TryToCatch

### TryToCatch is a social engineering simulation tool designed for educational and ethical penetration testing purposes. It creates fake login pages for popular social media platforms to demonstrate phishing attacks and raise security awareness.

# Requirements

- Docker
- Docker Compose

# Installation & Usage

**1. Clone the repository**
```bash
git clone https://github.com/liorenline/TryToCatch.git
cd TryToCatch
```

**2. Build and run**
```bash
docker-compose run --rm trytocatch
```

# Notes

- Captured data is saved to `log.txt` automatically
- The server stops automatically after receiving credentials
- Works on any OS with Docker installed
