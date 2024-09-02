# Usar a imagem base do Squid
FROM ubuntu/squid:latest

# Copiar o arquivo de configuração do Squid
COPY squid.conf /etc/squid/squid.conf

# Expor a porta do Squid
EXPOSE 3128

# Comando para iniciar o Squid
CMD ["squid", "-N"]