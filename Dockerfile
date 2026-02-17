FROM haskell:9.2

WORKDIR /app

# Update repository URLs and install additional tools
RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i -e 's|security.debian.org|archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    sed -i -e '/buster-updates/d' /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
    vim \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy your Haskell files into the container
COPY . /app

# Command to run when the container starts
CMD ["ghci"]
