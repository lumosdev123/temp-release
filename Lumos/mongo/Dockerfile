FROM mongo:7.0

WORKDIR /app

# generating the keyfile for replicaset
RUN openssl rand -base64 756 > keyFile

# changing the permission and ownership of the key file
RUN chmod 400 /app/keyFile
RUN chown mongodb:mongodb /app/keyFile

# Command to start MongoDB with the specified options
CMD ["mongod", "--bind_ip_all", "--port", "27017", "--replSet", "mongo", "--keyFile", "/app/keyFile"]