FROM alpine:latest

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION=0.35

LABEL org.label-schema.schema-version="1.0.0-rc.1"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="hugo"
LABEL org.label-schema.description="Lightweight Alpine-Based Docker Image for Hugo"
LABEL org.label-schema.url="https://gohugo.io/"
LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.vcs-url=$VCS_URL
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.docker.cmd="docker run --rm --name=hugo -v ${PWD}:/home/hugo jidhay/hugo"
LABEL org.label-schema.docker.cmd.help="docker run --rm --name=hugo -v ${PWD}:/home/hugo jidhay/hugo help"
MAINTAINER Jean-Damien Hatzenbuhler <jd.hatzenbuler@gmail.com>

RUN wget -q https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_checksums.txt \
&& wget -q https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz \
&& grep hugo_${VERSION}_Linux-64bit.tar.gz hugo_${VERSION}_checksums.txt | sha256sum -sc \
&& tar -zxf hugo_${VERSION}_Linux-64bit.tar.gz hugo \
&& mv hugo /usr/bin \
&& rm -f hugo_${VERSION}_checksums.txt hugo_${VERSION}_Linux-64bit.tar.gz \
&& addgroup -g 1000 hugo \
&& adduser -u 1000 -h /home/hugo -s /sbin/nologin -G hugo -D hugo \
&& mkdir -p /home/hugo \
&& chown hugo:hugo /home/hugo

USER hugo

EXPOSE 1313

WORKDIR /home/hugo

ENTRYPOINT ["/usr/bin/hugo"]