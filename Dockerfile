FROM ubuntu:14.04

RUN apt-get update && \
  apt-get -y install openssh-client

# Create user "jenkins"
RUN id jenkins 2>/dev/null || useradd --uid 1000 --create-home jenkins

# EOF
