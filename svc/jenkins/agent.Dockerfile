FROM jenkins/ssh-agent:jdk17
RUN apt-get update && \
apt-get install -y ca-certificates curl gnupg2 software-properties-common apt-transport-https && \
install -m 0755 -d /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
chmod a+r /etc/apt/keyrings/docker.asc && echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null && apt-get update && \
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin iptables && usermod -aG docker jenkins
ENV DOCKER_TLS_CERTDIR=""
COPY custom-docker-entrypoint.sh /usr/local/bin/custom-docker-entrypoint.sh
VOLUME [ "/var/lib/docker" ]
RUN chmod +x /usr/local/bin/custom-docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/custom-docker-entrypoint.sh"]
