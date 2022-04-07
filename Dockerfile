ARG VARIANT="20.04"
FROM ubuntu:${VARIANT}
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install --no-install-recommends \
    locales build-essential clamav spamassassin vim

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN sa-update -D
ENV DEBIAN_FRONTEND=dialog
