FROM node:16-bullseye

# Build deps
RUN apt-get update && \
    apt-get install -y libxkbfile-dev pkg-config libsecret-1-dev libxss1 dbus xvfb libgtk-3-0 libgbm1

# vscode dist
RUN git clone --progress https://github.com/microsoft/vscode.git ./vscode
WORKDIR vscode

# Fixed version
# Update as needed
RUN git pull && \
    git checkout 6261075646f055b99068d3688932416f2346dd3b

# Build
COPY ./scripts/build.sh ./
RUN bash ./build.sh

# Entrypoint
COPY ./scripts/entrypoint.sh ./
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
