task % cd ..
Dock % mkdir task2
Dock % nano server.py
Dock % nano Dockerfile
Dock % docker build -t simple-http .
[+] Building 3.1s (8/8) FINISHED


Dock % docker run --rm -p 8000:8000 simple-http
192.168.65.1 - - [дата время] "GET / HTTP/1.1" 200 -

Dock % clear

Dock % cat Dockerfile