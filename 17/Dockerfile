FROM docker:17-dind

COPY dockerd-entrypoint2.sh /usr/local/bin/

ARG DOCKER_MTU=1500

ENTRYPOINT ["dockerd-entrypoint2.sh"]
