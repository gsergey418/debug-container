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
    bash-completion \
    sudo \
    coreutils

# Set up bash configuration for root
RUN cat << 'EOF' >> /root/.bashrc
export EDITOR=vim
set -o vi
export PS1='\[\e[1;32m\]\u@\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]\$ '

# History control
export HISTCONTROL=ignoreboth
shopt -s histappend
export HISTSIZE=1000
export HISTFILESIZE=2000

# Window size and globbing
shopt -s checkwinsize
shopt -s globstar

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi
EOF

# Create a non-root user for security if needed (default to root for debugging)
RUN addgroup -S debug && adduser -S debug -G debug -s /bin/bash && \
    echo "debug ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set up bash configuration for debug user
RUN cp /root/.bashrc /home/debug/.bashrc && \
    chown debug:debug /home/debug/.bashrc

USER debug

CMD ["/bin/bash"]
