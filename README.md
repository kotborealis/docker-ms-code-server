# docker-ms-code-server

Docker container with [Microsoft Code-Server](https://code.visualstudio.com/docs/remote/vscode-server) installed.

By using this image you are accepting [code-server license](https://aka.ms/vscode-server-license).

Notes:

* License is accepted during build-time and run-time.
* Telemetry is disabled.

## Build

Run the following command:

```sh
docker build . -t ms-code-server:latest
```

If you are using some kind of proxy to access remote network, try building with `network=host` mode:
```sh
docker build . -t ms-code-server:latest --network=host
```

## Usage 

Run the following command to start the code-server:

```
docker run -it --rm -v $(pwd):$(pwd) -p 127.0.0.0:9090:8080 ms-code-server --port 8080
```

Open `http://127.0.0.1:9090` in your browser.

