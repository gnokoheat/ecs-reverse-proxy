# ecs-reverse-proxy
![GitHub](https://img.shields.io/github/license/gnokoheat/ecs-reverse-proxy) ![Docker Pulls](https://img.shields.io/docker/pulls/gnokoheat/ecs-reverse-proxy) ![GitHub repo size](https://img.shields.io/github/repo-size/gnokoheat/ecs-reverse-proxy) ![GitHub last commit](https://img.shields.io/github/last-commit/gnokoheat/ecs-reverse-proxy)

**AWS ECS reverse proxy using HA Proxy**

- In case of dynamic port mapping, you can set HA-Proxy revere proxy container linking your app container.

![](https://github.com/gnokoheat/ecs-reverse-proxy/blob/master/ecs-reverse-proxy.png?raw=true)

## Usage

- Environment variables for linking with app : `LINK_APP`, `LINK_PORT`
- Task definition (taskdef.json) example

```
"containerDefinitions": [
      // 1. reverse proxy container
      {
        "name": "<APP_NAME>-rp",
        "image": "gnokoheat/ecs-reverse-proxy:latest",
        "essential": true,
        "memoryReservation": 128,
        "portMappings": [
          {
            "hostPort": 0,
            "containerPort": 80,
            "protocol": "tcp"
          }
        ],
        "links": [
          "<APP_NAME>"
        ],
        "environment": [
          {
            "name": "LINK_PORT",
            "value": "<SERVICE_PORT>"
          },
          {
            "name": "LINK_APP",
            "value": "<APP_NAME>"
          }
        ]
      },
      // 2. app container
      {
        "name": "<APP_NAME>",
        ...
      }
]
```

- Get the docker hub image
```
docker pull gnokoheat/ecs-reverse-proxy:latest
```

## Related

- ECS Node.js app example : https://github.com/gnokoheat/ecs-nodejs-app-example
- Infra code (Terraform) for this app : https://github.com/gnokoheat/ecs-with-codepipeline-example-by-terraform
