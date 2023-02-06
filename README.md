# nextcloud

## Information

This docker comopse will add a stack containing nextcloud with a redis and maria database.
A nginx proxymanager is in front and as hack to run cron the same nextcloud with cron entrypoint

## Images

nextcloud-proxymanager -> 'jc21/nginx-proxy-manager:latest'

nextcloud-db -> mariadb

nextcloud-redis -> redis

nextcloud -> nextcloud

cron -> nextcloud (with different entry point to make cron available)
