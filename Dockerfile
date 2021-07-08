FROM alpine:3.14

RUN apk add --no-cache curl \
    && curl \
        -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
        -o /usr/local/bin/kubectl \
    && curl \
        -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.2.0/kustomize_v4.2.0_linux_amd64.tar.gz \
        -o /usr/local/bin/kustomize \
    && curl \
        -L https://github.com/instrumenta/kubeval/releases/download/v0.16.1/kubeval-linux-amd64.tar.gz \
        | tar xvz -C /usr/local/bin kubeval \
    && curl \
        -L https://github.com/zegl/kube-score/releases/download/v1.11.0/kube-score_1.11.0_linux_amd64 \
        -o /usr/local/bin/kube-score \
    && curl \
        -L https://get.helm.sh/helm-v3.6.2-linux-amd64.tar.gz \
        | tar xvz -C /tmp linux-amd64/helm \
        && mv /tmp/linux-amd64/helm /usr/local/bin \
        && rmdir /tmp/linux-amd64 \
    && chmod +x \
        /usr/local/bin/kubectl \
        /usr/local/bin/kustomize \
        /usr/local/bin/kubeval \
        /usr/local/bin/kube-score \
        /usr/local/bin/helm
