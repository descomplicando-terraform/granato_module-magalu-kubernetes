FROM alpine:3.20.0

# Definir o diretório de trabalho
WORKDIR /app

# Atualiza os índices de pacote do Alpine e instala as versões específicas
# dos pacotes curl, wget e tar, sem guardar o cache dos pacotes para reduzir o tamanho.
RUN apk update && \
    apk add --no-cache \
    bash=5.2.26-r0 \
    curl=8.9.0-r0 \
    wget=1.24.5-r0 \
    tar=1.35-r2

# Definir a versão do MGC_CLI
ARG MGC_VERSION=0.23.0
# Baixa o arquivo tar.gz do mgccli do GitHub de forma silenciosa, extrai o conteúdo,
# move o executável para /usr/local/bin, dá permissão de execução e remove os arquivos temporários.
RUN wget https://github.com/MagaluCloud/mgccli/releases/download/v${MGC_VERSION}/mgccli_${MGC_VERSION}_linux_amd64.tar.gz --quiet && \
    tar -xzf mgccli_${MGC_VERSION}_linux_amd64.tar.gz -C /tmp && \
    mv /tmp/mgc /usr/local/bin/mgc && \
    chmod +x /usr/local/bin/mgc && \
    rm -rf /tmp/*

# Definir a versão do Terraform
ARG TERRAFORM_VERSION=1.9.4
# Baixa o binário do Terraform e o instala em /usr/local/bin
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip --quiet && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/terraform && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Cria um usuário chamado 'non-root-user' com UID 1001 sem criar um diretório home padrão.
RUN adduser -D -u 1001 non-root-user

# O container escutará na porta 8095.
EXPOSE 8095

# O container será executado como o usuário 'non-root-user'.
USER non-root-user

# Define o diretório de trabalho para /app.
WORKDIR /app

# Define o comando padrão e o shell para execução.
CMD ["tail", "-f", "/dev/null"]
