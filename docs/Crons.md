# Crons





```bash
# Run gr8 matomo core archive
5 * * * * cd /home/jorge/gr8it/jorgeuos/matomo-training/matomo && docker compose exec -t matomo php /var/www/html/console core:archive --url=https://matomo.gr8.capow.se/ >> /var/logs/docker-containers/matomo-archive.log 2>&1
```


```bash
# Generate fake visits for idsite 2
5 0 * * * /home/jorge/gr8it/jorgeuos/matomo-training/scripts/generate_fake_visits.sh >> /var/logs/docker-containers/matomo-fake-visits.log 2>&1
```