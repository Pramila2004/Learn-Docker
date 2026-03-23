# 🐳 Docker Basics – Day 1

This repository contains my **Day 1 learning of Docker**, where I explored the fundamentals and dockerized a simple Node.js application.

---

# 📌 1. What is Docker?

Docker is a platform that allows developers to:
- Build applications
- Package them with all dependencies
- Run them consistently across different environments

👉 It solves the problem:
**“It works on my machine but not on yours.”**

---

# ⚙️ 2. Install Docker on Windows

### Steps:
1. Go to the official Docker website  
2. Download **Docker Desktop for Windows**  
3. Install it like a normal application  
4. Restart your system if required  

### Verify Installation:
```bash
docker --version
docker run hello-world
```

📦 3. Docker Image
A Docker Image is a blueprint of an application
It contains:
OS
Dependencies
Application code
Example:
```bash
docker pull ubuntu
docker pull node:18
```

📦 4. Docker Container
A Container is a running instance of an image
It executes the application
Run Container:
```bash
docker run -it ubuntu
```

⬇️ 5. Download Docker Images
```bash
docker pull ubuntu
docker pull node:18
```
💻 6. Execute Commands Inside Container
Run container:
```bash
docker run -it ubuntu
```

🌐 7. Port Exposing

To access your application in the browser:
```bash
docker run -p 8000:8000 my-image
```
👉 Format:
```bash
host_port : container_port
```


🟢 8. Create Simple Node.js Server
main.js
```bash
import express from 'express';

const app = express();
const PORT = 8000;

app.get('/', (req, res) => {
    res.json({ message: 'Hello from Docker' });
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
```

🧱 9. Dockerfile (Dockerization)
```bash
FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 8000

CMD ["node", "main.js"]🧱 9. Dockerfile (Dockerization)
FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 8000

CMD ["node", "main.js"]
````

🏗️ 10. Create Docker Image
```bash
docker build -t my-first-docker-image .
```

▶️ 11. Run Docker Image
```bash
docker run -p 8000:8000 my-first-docker-image
🌍 12. Test in Browser
```
Open:
```bash
http://localhost:8000
```
Output:
```bash
{"message":"Hello from Docker"}
```


```bash
docker --version
docker run hello-world
