FROM ubuntu:22.04
# Installing prerequisites
RUN apt-get update && apt-get install -y fortune-mod cowsay netcat && rm -rf /var/lib/apt/lists/*

# Copying app
COPY wisecow.sh /app/wisecow.sh
WORKDIR /app
RUN chmod +x wisecow.sh

# Exposing the required port
EXPOSE 4499

# Runnning application
CMD ["./wisecow.sh"]

