FROM alpine:3.11

ARG K8S_VERSION
ARG HELM_VERSION
ARG HELM_GCS_VERSION

# install kubectl
RUN apk update && apk add --no-cache curl git && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# install helm
RUN curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xz && \
    mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 && \
    rm /var/cache/apk/*

# install helm gcs plugin
RUN helm plugin install https://github.com/hayorov/helm-gcs --version ${HELM_GCS_VERSION} && \
    apk del --purge git && \
    rm -r /root/.cache/
