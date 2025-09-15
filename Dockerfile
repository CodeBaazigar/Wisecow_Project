RUN apt-get update && apt-get install -y \
    fortune-mod cowsay netcat && rm -rf /var/lib/apt/lists/*
COPY wisecow.sh /app/wisecow.sh
WORKDIR /app
RUN chmod +x wisecow.sh
EXPOSE 4499
CMD ["./wisecow.sh"]

