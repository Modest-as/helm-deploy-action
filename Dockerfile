FROM alpine:3.10.2

ENV BASE_URL="https://get.helm.sh"
ENV HELM_2_FILE="helm-v2.14.3-linux-amd64.tar.gz"

RUN apk add --no-cache ca-certificates jq curl bash && \
    curl -L ${BASE_URL}/${HELM_2_FILE} | tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
