task3 nano show_env.py
task3 % nano Dockerfile

task3 % docker build -t env-demo .
[+] Building 2.4s (8/8) FINISHED




#сам файл
FROM python:3.12-slim
ARG DEFAULT_USER_NAME=student
ENV USER_NAME=${DEFAULT_USER_NAME}
WORKDIR /app
COPY show_env.py .
CMD ["python", "show_env.py"]

task3 % docker run --rm env-demo
Hello, student from inside Docker!
task3 % nano Dockerfile
