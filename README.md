# Docker x Apache x VS Code Web Dev Environment (Windows 10/11)

Overview
--------

This is a Dockerized web development environment using Apache as a web server, set up to work with Visual Studio Code. This environment delivers static pages, so it does not include any server-side architecture. Apache is setup to listen on `localhost:8080` since this is intended as a development environment, but this can be changed within `my-httpd.conf`. This setup is verified to work on Windows 10/11.

### Usage

The `public-html` folder is bound to apache's `htdocs` folder inside the container. Any changes made in the container will automatically reflect in `public-html`. This allows you to handle git outside of the container.  
  
If you use [WinSCP](https://winscp.net/eng/index.php) to SFTP files to your web server, then you can use `/automations/sync_winscp.bat` to sync files in `public-html` with your web server's `htdocs` folder. To get started, read and fill out `/automations/env/sync_winscp_defaults.example`. Once finished, rename the file to `sync_winscp_defaults.bat`.

Installation
------------

### Requirements

1.  [Visual Studio Code](https://code.visualstudio.com/)
    *   Install extension: [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2.  [Docker](https://www.docker.com/get-started/) (Tested with Docker for Windows)

### Optional

1.  [WinSCP](https://winscp.net/eng/index.php)

### Steps

1.  Install requirements.
2.  Clone this repo.
3.  Open Docker and Visual Studio Code.
4.  Hit F1 to open the command palette.
5.  In the VS Code command palette, run `Dev Containers: Reopen in Container`
    *   If prompted, sign into GitHub. For different authentication methods into GitHub, check the [About authentication to GitHub](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/about-authentication-to-github#authenticating-to-the-api-with-a-personal-access-token) article
6.  Once VS Code loads with the container, you can now go to `localhost:8080` in your browser and see this guide!

Extra Information
-----------------

`Dockerfile`

*   Dockerfile contains information about the Docker image that the container uses.
*   [Full specification for `Dockerfile` here.](https://docs.docker.com/engine/reference/builder/)

`.devcontainer.json`

*   Devcontainer contains useful information about the container and how it interacts with VS Code. Port forwarding ports, commands to run on container start, VS Code extensions this container uses, etc.
*   [Full specification for `devcontainer.json` here.](https://containers.dev/implementors/json_reference/)

`public-html/`

*   Directory of web pages that Apache displays to `localhost:8080`

`my-httpd.conf`

*   Apache server settings file full of configuration directives.
*   [Full specification for the Apache config file here.](http://httpd.apache.org/docs/2.4/mod/directives.html)

`automations/`

*   Directory of batch scripts that perform common, repetitive actions.
*   `env/`
    
    *   Folder containing potentially private/sensitive values that should not be pushed to a repository.
    *   `sync_winscp_defaults.example`
        *   This file contains comments outlining information about each variable and what it's for.
        *   Filling the variables in this file and changing the extension to ".bat" is necessary to be able to run sync\_winscp.bat.
        *   Requires [WinSCP](https://winscp.net/eng/index.php).
    
    `sync_winscp.bat`
    
    *   Use WinSCP to compare files in a local directory, then translates/synchronizes all differences to a remote directory. (Requires configuration and file extension change of automations/env/sync\_winscp\_defaults.example)
    *   Requires [WinSCP](https://winscp.net/eng/index.php).
    
    `sync_winscp_script.bat`
    *   Helper file used by sync\_winscp.bat.
    *   [The scripts code follows automation info from WinSCP CLI documentation.](https://winscp.net/eng/docs/guide_automation)
    *   Requires [WinSCP](https://winscp.net/eng/index.php).
