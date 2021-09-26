ARG TARGET=focal
FROM ubuntu:${TARGET}

ARG TZ=Asia/Tokyo
ARG LANG=ja_JP.UTF-8

ENV TZ ${TZ}
ENV LANG ${LANG}
ENV LC_ALL ${LANG}
ENV DEBIAN_FRONTEND=noninteractive

# Install language and timezone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime \
  && apt-get update && apt-get install -y \
  locales \
  tzdata \
  && locale-gen ${LANG} \
  && update-locale LC_ALL=${LC_ALL} LANG=${LANG} \
  && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=
