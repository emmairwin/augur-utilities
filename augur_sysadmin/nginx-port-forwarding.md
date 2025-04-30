# Port Forwarding with NGINX

If you have a setup where you need to move ports between different computers on a LAN, through a single server exposed to the internet, for example, you can use the stream block in the `nginx.conf` file to do said mapping. Below is an example of one such block. 

```bash
stream {
    server {
        listen 5433;  # Port exposed on this server
        proxy_pass 192.168.1.126:5432;  # Forward traffic to local PostgreSQL
        proxy_connect_timeout 20s;
        proxy_timeout 300s;
    }
    server {
        listen 5900;  # Port exposed on this server
        proxy_pass 192.168.1.126:5900;  # Forward traffic to local PostgreSQL
        proxy_connect_timeout 20s;
        proxy_timeout 300s;
    }
    server {
        listen 5901;  # Port exposed on this server
        proxy_pass 192.168.1.126:5901;  # Forward traffic to local PostgreSQL
        proxy_connect_timeout 20s;
        proxy_timeout 300s;
    }
    server {
        listen 5902;  # Port exposed on this server
        proxy_pass 192.168.1.126:5902;  # Forward traffic to local PostgreSQL
        proxy_connect_timeout 20s;
        proxy_timeout 300s;
    }
    server {
        listen 5005;  # Port exposed on this server
        proxy_pass 192.168.1.126:5005;  # Forward traffic to local PostgreSQL
        proxy_connect_timeout 20s;
        proxy_timeout 300s;
    }
    server {
        listen 8210;  # Port exposed on this server
        proxy_pass 192.168.1.126:8200;  # Forward traffic to local PostgreSQL
        proxy_connect_timeout 20s;
        proxy_timeout 300s;
    }
    server {
        listen 8082;  # Port exposed on this server
        proxy_pass 192.168.1.126:8080;  # Forward traffic to local PostgreSQL
        proxy_connect_timeout 20s;
        proxy_timeout 300s;
    }
}
```