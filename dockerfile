# Usar uma imagem base do Ubuntu
FROM ubuntu:20.04

# Instalar o Squid
RUN apt-get update && apt-get install -y squid && \
    mkdir -p /var/log/squid /var/cache/squid && \
    chown -R proxy:proxy /var/log/squid /var/cache/squid

# Copiar o arquivo de configuração do Squid
COPY squid.conf /etc/squid/squid.conf

# Expor a porta do Squid
EXPOSE 3128

# Comando para iniciar o Squid
CMD ["squid", "-N"]