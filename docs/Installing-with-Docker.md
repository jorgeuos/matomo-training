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


## To be able to run multiple containers in the same network, we need to create a network first:

```bash
docker network create gr8-shared-network
```



## test the tracker

```js
  var _paq = window._paq = window._paq || [];
  /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//matomo.gr8.capow.se/";
    _paq.push(['setTrackerUrl', u+'matomo.php']);
    _paq.push(['setSiteId', '1']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
  })();
```


## Running Cron jobs

From Ubuntu

Create a log folder for Matomo:
```bash
mkdir /var/logs/matomo
```

```bash
5 * * * * cd /home/jorge/gr8it/jorgeuos/matomo-training/matomo && /usr/bin/docker compose exec -T matomo /var/www/html/console core:archive --url=https://matomo.gr8.capow.se/ >> /var/logs/docker-containers/matomo-archive.log 2>&1
```

Another method for portability:

Method 2: Cron Job Inside the Docker Container

Another approach is to set up the cron job inside the Docker container itself. This can be a bit more complex but keeps everything encapsulated within the container.

Custom Dockerfile: Create a custom Dockerfile for Matomo where you set up cron:


```Dockerfile
FROM matomo:4.15.1
RUN apt-get update && apt-get install -y cron
COPY matomo-cron /etc/cron.d/matomo-cron
RUN chmod 0644 /etc/cron.d/matomo-cron
RUN crontab /etc/cron.d/matomo-cron
CMD ["cron", "-f"]
```

Cron Job File (matomo-cron): Create a file named matomo-cron with the following content:


```bash
5 * * * * www-data /usr/bin/php /var/www/html/console core:archive --url=https://matomo.gr8.capow.se/ >> /var/log/matomo-archive.log 2>&1
```

Docker Compose: Modify your Docker Compose to use the custom Dockerfile.

Build and Run: Build this custom Docker image and run it with your Docker Compose setup.



