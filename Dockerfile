

FROM ubuntu:24.04

# Install application dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    fortune-mod \
    fortunes-min \
    cowsay \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Add games directory to PATH
ENV PATH="/usr/games:${PATH}"

# Set working directory
WORKDIR /app

# Copy application
COPY wisecow.sh .

# Make executable
RUN chmod +x wisecow.sh

# Application port
EXPOSE 4499

# Start application
CMD ["./wisecow.sh"]


