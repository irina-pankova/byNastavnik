app.py
    print()


Dockerfile
    FROM python:3.12-slim
    
    WORKDIR/app
    
    COPY app.py .

    CMD ["python", "app.py"]

docker-compose.yml
    version: "3.9"

    services: 
        app:
            build: .
            container_name: simple_app




