# TODO Service

Микросервис для управления списком задач на FastAPI.

## Запуск через Docker

docker volume create todo_data

docker build -t todo-service:latest .

docker run -d   -p 8000:80   -v todo_data:/app/data   --name todo-service   todo-service:latest

## Документация API

http://localhost:8000/docs

## Структура проекта
.
├── app
│   ├── __init__.py
│   ├── db.py
│   ├── main.py
│   └── schemas.py
├── Dockerfile
├── README.md
└── requirements.txt