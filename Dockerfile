FROM ubuntu:22.04
# Installing prerequisites
RUN apt-get update && apt-get install -y fortune-mod cowsay netcat && rm -rf /var/lib/apt/lists/*

# Copy app
COPY wisecow.sh /app/wisecow.sh
WORKDIR /app
RUN chmod +x wisecow.sh

# Add /usr/games to PATH
ENV PATH="/usr/games:${PATH}"

# Expose port
EXPOSE 4499

# Run app
CMD ["./wisecow.sh"]

