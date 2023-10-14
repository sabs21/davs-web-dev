# Docker x Apache x VS Code Web Dev Environment (Windows 10/11)

## Overview

This is a Dockerized web development environment using Apache as a web server, set up to work with Visual Studio Code. This environment delivers static pages, so it does not include any server-side architecture. Apache is setup to listen on `localhost:8080` since this is intended as a development environment, but this can be changed within `my-httpd.conf`. This setup is verified to work on Windows 10/11.

## Installation

### Requirements

1.  [Visual Studio Code](https://code.visualstudio.com/)
    -   Install extension: [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2.  [Docker](https://www.docker.com/get-started/) (Tested with Docker for Windows)

### Optional

1.  [WinSCP](https://winscp.net/eng/index.php)

### Steps

#### Using GitHub in VS Code

Utilizing GitHub through VS Code allows you to push to your GitHub repo easily within the Docker container.

1.  Install requirements
2.  Clone this repo and push to GitHub
3.  Ensure Docker is running, then open Visual Studio Code.
4.  Hit F1
5.  In the VS Code command palette, run `Dev Containers: Clone Repository in Container Volume`
    -   If prompted, sign into GitHub. For different authentication methods into GitHub, check the [About authentication to GitHub](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/about-authentication-to-github#authenticating-to-the-api-with-a-personal-access-token) article
6.  Choose your forked repo
7.  Once VS Code loads with the container, you can now go to `localhost:8080` in your browser and see this guide!

#### Without GitHub in VS Code

1.  Install requirements
2.  Clone this repo
3.  Ensure Docker is running, then open Visual Studio Code.
4.  Open the folder from the repo in VS Code
    -   File > Open Folder... > Browse to the repo folder > Open
5.  Reopen VS Code in the Docker container
    1.  Hit F1
    2.  In the VS Code command palette, run `Dev Containers: Reopen in Container`
6.  Once VS Code loads with the container, you can now go to `localhost:8080` in your browser and see this guide!

## Usage

`.devcontainer/Dockerfile`

-   Dockerfile contains information about the Docker image that the container uses.
-   [Full specification for `Dockerfile` here.](https://docs.docker.com/engine/reference/builder/)

`.devcontainer/devcontainer.json`

-   Devcontainer contains useful information about the container and how it interacts with VS Code. Port forwarding ports, commands to run on container start, VS Code extensions this container uses, etc.
-   [Full specification for `devcontainer.json` here.](https://containers.dev/implementors/json_reference/)

`public-html/`

-   Directory of web pages that Apache displays to `localhost:8080`

`my-httpd.conf`

-   Apache server settings file full of configuration directives.
-   [Full specification for the Apache config file here.](http://httpd.apache.org/docs/2.4/mod/directives.html)

`automations/`

-   Directory of batch scripts that perform common, repetitive actions.
-   `env/`

    -   Folder containing potentially private/sensitive values that should not be pushed to a repository.
    -   `sync_winscp_defaults.example`
        -   This file contains comments outlining information about each variable and what it's for.
        -   Filling the variables in this file and changing the extension to ".bat" is necessary to be able to run sync_winscp.bat.
        -   Requires [WinSCP](https://winscp.net/eng/index.php).

    `sync_winscp.bat`

    -   Use WinSCP to compare files in a local directory, then translates/synchronizes all differences to a remote directory. (Requires configuration and file extension change of automations/env/sync_winscp_defaults.example)
    -   Requires [WinSCP](https://winscp.net/eng/index.php).

    `sync_winscp_script.bat`

    -   Helper file used by sync_winscp.bat.
    -   [The scripts code follows automation info from WinSCP CLI documentation.](https://winscp.net/eng/docs/guide_automation)
    -   Requires [WinSCP](https://winscp.net/eng/index.php).
