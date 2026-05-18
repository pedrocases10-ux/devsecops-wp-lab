# 1. Patching: Use the official, latest stable and secure WordPress image
FROM wordpress:latest

# 2. Hardening: Remove unnecessary packages and clean cache to reduce attack surface
RUN apt-get update && apt-get install -y --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 3. Hardening: Mitigate privilege escalation by running as non-root user
# 33 is the standard ID for 'www-data' user in Debian/Ubuntu web servers
USER 33:33
