# nginx-proxy-samples

## Introduction

Helper scripts, templates and docker compose to quickly wire up a dockerized nginx proxy with ssl using jwilder/nginx-proxy etc

## Powershell

- nginx-proxy/nginx-proxy-letsencrypt.ps1 - docker run of nginx-proxy and docker-letsencrypt-nginx-proxy-companion running on 80:443 (built by jwilder)
  -- Args: email (email of target hostname to recieve letencrypt notifications)

- nginx-proxy/nginx-proxied-sample.ps1 - sample docker run to launch proxied container on a hostname (expects EXPOSE 80 on containers)

## Docker compose

- nginx-proxy/docker-compose.yaml - runs nginx-proxy and docker-letsencrypt-nginx-proxy-companion

## nginx

- nginx/template.tmpl - sample nginx template

# References

nginx/template.tmpl -
Taken from notes in https://tutorials.technology/tutorials/30-how-to-use-nginx-reverse-proxy-with-docker.html

https://github.com/nginx-proxy/nginx-proxy
https://github.com/nginx-proxy/docker-letsencrypt-nginx-proxy-companion
