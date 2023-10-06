# Docker x Apache x VS Code Web Dev Environment (Windows 10/11)

## Overview

This is a Dockerized web development environment using Apache as a web server, set up to work with Visual Studio Code. This environment delivers static pages, so it does not include any server-side architecture. Since Apache is setup to listen on `localhost:8080` since this is intended as a development environment, but this can be changed within my-httpd.conf. This setup is verified to work on Windows 10/11.

## Installation

### Requirements

1.  [Visual Studio Code](https://code.visualstudio.com/)
    - Install extension: [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2.  [Docker](https://www.docker.com/get-started/) (Tested with Docker for Windows)

### Steps

1.  Install requirements
2.  Clone this repo
3.  Ensure Docker is running, then open Visual Studio Code.
4.  Open the folder from the repo in VS Code
    1.  File > Open Folder... > Browse to the repo folder > Open
5.  Reopen VS Code in the Docker container
    1.  Hit F1
    2.  In the VS Code command palette, run `Dev Containers: Reopen in Container`
6.  Once VS Code loads with the container, you can now go to `localhost:8080` in your browser and see this guide!

## Usage

- `.devcontainer/Dockerfile`
  - This contains information about the Docker image that the container uses.
  - [Full specification for `Dockerfile` here.](https://docs.docker.com/engine/reference/builder/)
- `.devcontainer/devcontainer.json`
  - Contains useful info about the container and how it interacts with VS Code. Port forwarding ports, commands to run on container start, VS Code extensions this container uses, etc.
  - [Full specification for `devcontainer.json` here.](https://containers.dev/implementors/json_reference/)
- `public-html`
  - Directory of web pages that Apache displays to `localhost:8080`
