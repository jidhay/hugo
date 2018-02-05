# Docker Image

[![](https://images.microbadger.com/badges/image/jidhay/hugo.svg)](https://microbadger.com/images/jidhay/hugo "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/jidhay/hugo.svg)](https://microbadger.com/images/jidhay/hugo "Get your own version badge on microbadger.com")

# Description
Lightweight Alpine-Based Docker Image for [Hugo](https://gohugo.io/) which :
- expose the Hugo default port: __1313__
- create a non-root user: __hugo__
- create an home directory for this user: __/home/hugo__ 

The image use the [Label Schema](http://label-schema.org/rc1/) .

Latest build contains the Hugo v0.20.3

# Build
To build the image from DockerFile :
```bash
docker build --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VERSION="0.35" -t hugo:0.35 -t hugo ..
```

# Usage

Builds your site located in the current directory of the following command line : 

```bash
docker run --rm --name=hugo -v ${PWD}:/home/hugo jidhay/hugo
```


Serves your site located in the current directory of the following command line : 

```bash
docker run --rm --name=hugo -p 1313:1313 -v ${PWD}:/home/hugo jidhay/hugo server
```


Display all the available commands : 

```bash
docker run --rm --name=hugo -p 1313:1313 -v ${PWD}:/home/hugo jidhay/hugo help
```
