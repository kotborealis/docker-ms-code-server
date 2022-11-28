# docker-ms-code-server

Docker container with [Microsoft Code-Server](https://code.visualstudio.com/docs/remote/vscode-server) compiled from sources.
Basically, this is an OSS version of code-server.

By using this image you are accepting [code-server license](https://aka.ms/vscode-server-license).

## Build

Run the following command:

```sh
docker-compose build
```

## Usage 

Run the following command to start the code-server:

```
docker-compose up
```

Open `http://127.0.0.1:8080` in your browser.
You can specify custom port via `CODE_PORT` env variable.
You could also tweak `docker-compose.yaml` as you desire.
