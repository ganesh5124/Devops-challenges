# Things learned in this challenge

* Reverse proxy in Nginx
* Nginx configuration
* Nginx location block
* Nginx proxy_pass directive
* Nginx proxy_set_header directive
* Nginx proxy_redirect directive

# Nginx configuration for reverse proxy

```nginx

server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_redirect off;
    }
}

```

# Description
* A reverse proxy is a server that sits between clients and backend servers. It forwards client requests to the backend servers and forwards the response from the backend servers to the clients. Nginx can be used as a reverse proxy server.

* In the above configuration, we have a server block that listens on port 80 for the domain example.com. The location block specifies that all requests to the root path (/) should be proxied to http://localhost:3000. The proxy_pass directive specifies the backend server to which the requests should be forwarded.

* The proxy_set_header directives are used to set the headers that will be sent to the backend server. These headers include the Host header, the X-Real-IP header, the X-Forwarded-For header, and the X-Forwarded-Proto header. These headers are used to provide information about the client's IP address, the protocol used, and the original host header.

* The proxy_redirect directive is used to modify the Location and Refresh headers in the response from the backend server. In this case, we have set it to off, which means that the Location and Refresh headers will not be modified.

* This configuration sets up a reverse proxy in Nginx that forwards requests from example.com to http://localhost:3000. The proxy_pass directive specifies the backend server, and the proxy_set_header directives set the headers that will be sent to the backend server. The proxy_redirect directive is used to modify the Location and Refresh headers in the response from the backend server.
