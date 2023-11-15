# This guid will teach you how to install Matomo with Docker compose

I'm going to assume that you have some terminal knowledge and that you have Docker and Docker compose installed on your machine.

Here are some steps on how to install docker on Ubuntu:

1. Install Docker

```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

2. Update Docker Compose: The method to update Docker Compose depends on how it was originally installed. If you installed it using apt, you can update it similarly:

```bash
sudo apt-get update
sudo apt-get install docker-compose
```

If you installed it as a standalone binary (which is common), you can update it by downloading the latest version from its GitHub repository. First, check the latest release version on the Docker Compose GitHub repository. Then, replace [latest-version] in the following command with the latest version number:


At the time of writing it was `2.23.0`.

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/[latest-version]/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

If your familiar with the old stand alone docker-compose, with a hyphen. Adjust to Docker Compose V2: Docker Compose v2.x has some differences compared to v1.x, mainly in how it's invoked. It's now a Docker plugin, so you can use it as docker compose (without the hyphen) instead of docker-compose. However, the old docker-compose command should still work for backward compatibility.




