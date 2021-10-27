# Docker skeleton for new symfony projects

## Requirements

- Docker machine env (for consistency and MacOS mount speed improvements)

## Stack

- Supervisord for nginx and php-fpm running
- php-fpm 8 and nginx in one container

## Start

### Dev

1) cd to .docker/dev
2) run docker-compose up -d
3) set up /etc/hosts to point to machine ip
4) wait until docker finishes installing symfony to src folder (if it exists this part will be skipped)
5) go to hostname:8000
6) if everything works remove .git directory and add your own vcs

### Prod

1) cd to .docker/prod
2) run docker-compose up -d
3) visit domain on port 80
4) if everything works remove .git directory and add your own vcs
