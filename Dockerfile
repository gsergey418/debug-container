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
    tzdata

# Create a non-root user for security if needed (default to root for debugging)
# RUN addgroup -S debug && adduser -S debug -G debug

WORKDIR /workspace

CMD ["/bin/bash"]
