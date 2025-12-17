app.py
    print(os.getenv("DBHOST"))


Dockerfile
    FROM python:3.12-slim
    
    WORKDIR/app
    
    COPY app.py .

    CMD ["python", "app.py"]

docker-compose.yml
    version: "3.9"

    services: 
        web:
            build: .
            container_name: web_app
            depends_on:
                - db
            environment:
                DB_HOST:db
                DB_PORT:5432
                ... 
            ports:
                - "8080:8000"

        db:
            image: postgres:16
            container_name: env_db
            environment:
            POSTGRES_DB: app_db
            POSTGRES_USER: app_user
            POSTGRES_PASSWORD: ${DB_PASSWORD}
            volumes:
                - db_data:/var/lib/postgresql/data
            restart: always
    networks:
      - backend
networks:
  backend:
volumes:
  db_data:


