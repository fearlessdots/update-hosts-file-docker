FROM ubuntu
RUN  apt-get update \
  && apt-get install -y wget unzip iputils-ping curl nano less \
  && rm -rf /var/lib/apt/lists/*
COPY setup /build/setup
RUN /build/setup
