FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Set working directory
WORKDIR /app

# Install Node.js
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Copy files
COPY package*.json ./
RUN npm install

COPY . .

# Expose port
EXPOSE 8000

# Run app
CMD ["node", "main.js"]