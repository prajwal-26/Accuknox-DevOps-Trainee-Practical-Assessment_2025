FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    apt-get clean

# Add /usr/games to PATH to access cowsay and fortune
ENV PATH="/usr/games:$PATH"

COPY wisecow.sh .

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["sh", "/app/wisecow.sh"]

