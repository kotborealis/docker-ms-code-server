FROM debian:latest

RUN apt update && apt install -y bash curl git nodejs

COPY ./scripts/build.sh ./build.sh

RUN ./build.sh

COPY ./scripts/entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
