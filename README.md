# Customized Wordpress Docker container

| ||
| --- | --- |
| License: |![GitHub](https://img.shields.io/github/license/8ear/docker-wordpress)|
| Github Workflow Build: | ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/8ear/docker-wordpress/8earDockerCI) |
| Docker Build Status: | ![Docker Build Status](https://img.shields.io/docker/cloud/build/8ear/wordpress) |
| Docker Automated build: | ![Docker Automated build](https://img.shields.io/docker/cloud/automated/8ear/wordpress) |
| Docker Pulls | ![Docker Pulls](https://img.shields.io/docker/pulls/8ear/wordpress) |
| Docker latest tag: | ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/8ear/wordpress/fpm) |
| Image size tag: fpm | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/8ear/wordpress/fpm) |


This repository is used to create via hub.docker.com automatic builds from the original wordpress:fpm container and add a layer for the following installed php modules:
- memcache (required for caching)
- redis (required for caching)
- pdo_mysql (required for mailpoet for example)


You can find this container: https://hub.docker.com/r/8ear/wordpress

