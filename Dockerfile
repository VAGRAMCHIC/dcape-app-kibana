ARG IMAGE=kibana
ARG IMAGE_VER=8.14.3

FROM --platform=$BUILDPLATFORM ${IMAGE}:${IMAGE_VER}

COPY kibana.yml /usr/share/kibana/config/kibana.yml
