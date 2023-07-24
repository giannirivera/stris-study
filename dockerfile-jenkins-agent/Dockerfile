# Use the official Jenkins agent base image
FROM jenkins/inbound-agent:4.10-4-jdk11

# Switch to the root user to install Docker
USER root

# Install Docker inside the Jenkins agent container
RUN apt-get update && apt-get install -y docker.io

# Switch back to the Jenkins user
USER jenkins