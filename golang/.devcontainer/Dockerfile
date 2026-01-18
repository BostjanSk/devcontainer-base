FROM alpine:latest

# Install minimal dependencies
RUN apk add --no-cache \
    curl \
    git \
    zsh \
    bash \
    ca-certificates

# Install latest stable Go (adjust version when needed)
ENV GO_VERSION=1.25.6

RUN curl -fsSL https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz -o /tmp/go.tgz \
    && tar -C /usr/local -xzf /tmp/go.tgz \
    && rm /tmp/go.tgz

ENV PATH="/usr/local/go/bin:${PATH}"

# Install starship (static binary, very small)
RUN curl -fsSL https://starship.rs/install.sh | sh -s -- -y

# Configure zsh to use starship
RUN echo 'eval "$(starship init zsh)"' >> /etc/zshrc

# Optional: create a non-root user similar to devcontainers
RUN adduser -D vscode
USER vscode

# Default shell
SHELL ["/bin/zsh", "-c"]
