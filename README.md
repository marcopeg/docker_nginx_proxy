# NGiNX Proxy

The pourpose of this project is to build a _NGiNX reverse proxy_ which maps subdomains to services listening on different ports.

## Scenario

- you have a virtual machine running on 12.34.56.78
- you have many `docker-compose` projects
- you have a domain for each project
- you want to map different projects to different domains

## The Problem I see

As simple as it can get if you want to deploy two websites to the same host, each of those would like to run on port `:80` but this can never happen!

## Namespace Host's Ports

A simple - yet rudimental - solution is to namespace the ports that each project is allowed to expose:

| project | port |
| :------ | :--- |
| marcopeg_com | 1000:1999 |
| noblackmagic_com | 2000:2999 |

## Configure NGiNX

```
http {
    server {
        server_name service1.com;
        location / { proxy_pass http://$HOST_IP:1080/; }
    }
    server {
        server_name service2.com;
        location / { proxy_pass http://$HOST_IP:2080/; }
    }
}
```

> You can use the `template.nginx.conf` which is provided, just rename it!

## Configure Docker Compose

The project is set up to source it's configuration from a `.env` file which you should create after you clone the repository (it is gitignored):

```
HOST_IP=12.34.56.78
HOST_PORT=80
```

> You can use the `template.env` which is provided, just rename it!

## Start NGiNX

```
./prod-up
```