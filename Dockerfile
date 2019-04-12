# Sha256 corresponds to tag '18.04'
FROM ubuntu@sha256:017eef0b616011647b269b5c65826e2e2ebddbe5d1f8c1e56b3599fb14fabec8

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential=12.* \
    ca-certificates=20180409 \
    curl=7.58.* \
    gcc=4:7.3.*\
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN curl -sSLO https://pjreddie.com/media/files/yolov3.weights

COPY . /app

RUN make

ENTRYPOINT ["./darknet"]

CMD []
