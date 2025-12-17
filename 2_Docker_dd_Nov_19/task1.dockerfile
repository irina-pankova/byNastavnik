task1 % docker run --rm hello-app .
Hello from Docker!
task % cat Dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY app.py .

CMD ["python", "app.py"]


