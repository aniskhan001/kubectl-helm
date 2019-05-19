FROM alpine:3.8

# install kubectl
RUN apk update && apk add --no-cache git curl bash openssl \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

# install helm
    RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh \
    && rm get_helm.sh

# install helm tiller plugin
    RUN helm init --client-only \
    && helm plugin install https://github.com/rimusz/helm-tiller
