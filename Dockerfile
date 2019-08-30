FROM alpine:3.10.1

RUN apk add --no-cache curl \
    && curl \
        -L https://storage.googleapis.com/kubernetes-release/release/v1.15.3/bin/linux/amd64/kubectl \
        -o /usr/local/bin/kubectl \
    && curl \
        -L https://github.com/kubernetes-sigs/kustomize/releases/download/v3.1.0/kustomize_3.1.0_linux_amd64 \
        -o /usr/local/bin/kustomize \
    && curl \
        -L https://github.com/instrumenta/kubeval/releases/download/0.13.0/kubeval-linux-amd64.tar.gz \
        | tar xvz -C /usr/local/bin kubeval \
    && curl \
        -L https://github.com/zegl/kube-score/releases/download/v1.2.1/kube-score_1.2.1_linux_amd64 \
        -o /usr/local/bin/kube-score \
    && chmod +x /usr/local/bin/kubectl /usr/local/bin/kustomize /usr/local/bin/kubeval /usr/local/bin/kube-score
