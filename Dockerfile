FROM alpine:latest

# Install common debugging tools
RUN apk add --no-cache \
    bash \
    bind-tools \
    curl \
    iproute2 \
    iputils \
    jq \
    net-tools \
    nmap \
    tcpdump \
    tshark \
    wget \
    vim \
    strace \
    sysstat \
    lsof \
    procps \
    htop \
    less \
    openssl \
    ca-certificates \
    git \
    tzdata \
    bash-completion

# Set up bash configuration
RUN echo "export EDITOR=vim" >> /root/.bashrc && \
    echo "set -o vi" >> /root/.bashrc && \
    echo "export PS1='\\[\\e[1;32m\\]\\u@\\h\\[\\e[m\\]:\\[\\e[1;34m\\]\\w\\[\\e[m\\]\\$ '" >> /root/.bashrc && \
    echo "source /etc/profile.d/bash_completion.sh" >> /root/.bashrc

# Create a non-root user for security if needed (default to root for debugging)
# RUN addgroup -S debug && adduser -S debug -G debug

WORKDIR /workspace

CMD ["/bin/bash"]
