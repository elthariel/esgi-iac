FROM debian:stable

ARG USER_UID=1000
ENV SHELL=/bin/bash \
    USER_UID="${USER_UID}" \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

RUN apt update && \
    apt dist-upgrade -y && \
    apt install -y zsh curl locales unzip less s3cmd sudo git && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean && \
    echo "en_US.UTF-8 UTF-8" >/etc/locale.gen && \
    locale-gen

WORKDIR /tmp
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/kubectl

ENV HELM_VERSION=3.13.0
RUN curl -LO "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    tar xvf "helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf helm-*.tar.gz linux-amd64

ENV SCW_VERSION=2.22.0
RUN curl -LO "https://github.com/scaleway/scaleway-cli/releases/download/v${SCW_VERSION}/scaleway-cli_${SCW_VERSION}_linux_amd64" && \
    chmod +x scaleway-cli_*_linux_amd64 && \
    mv scaleway-cli_*_linux_amd64 /usr/local/bin/scw

ENV TF_VERSION=1.5.7
RUN curl -LO "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip" && \
    unzip terraform_*_linux_amd64.zip && \
    mv terraform /usr/local/bin && \
    rm -rf terraform_*_linux_amd64.zip

RUN adduser --uid ${USER_UID} student && \
    echo "    student ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/student

WORKDIR /home/student
USER student

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

CMD ["/usr/bin/sleep", "infinity"]
