FROM node:16-bullseye

RUN apt-get update && \
    apt-get install -y libxkbfile-dev pkg-config libsecret-1-dev libxss1 dbus xvfb libgtk-3-0 libgbm1

RUN git clone --filter=tree:0 --progress https://github.com/microsoft/vscode.git

WORKDIR vscode
RUN yarn --frozen-lockfile

# Prevent electron build
RUN cat build/lib/preLaunch.js \
    | grep -v "await getElectron();" \
    > build/lib/preLaunch.slim.js

RUN node ./build/lib/preLaunch.slim.js
COPY ./scripts/entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

