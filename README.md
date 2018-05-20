# nginx-letsencrypt-cloudflare
Auto letsencrypt for cloudflare and nginx users

Requirements:
- Docker
- Docker-compose

Setup:

1. Create dnscloudflare.ini (Look at the example_dnscloudflare.ini)
2. Modify the docker-compose.yaml

  => Uncomment and change the DOMAINS Env variable to a comma seperated list of domains. Wildcards are supported.
  
  => Uncomment and change the EMAIL Env variable to your E-Mail Adresse
  
  => Uncomment and change the AGREE_TOS Env variable to anything or just to `true`. With this variable you are agreeing to the letsencrypt Tos.

  => Add the port entries:
  
  ```yaml
  version: "3.5"
  services:
    # [...]
    nginx:
      build: nginx/
      # [...]
      ports:
      - 443:443
      - 80:80
  ```
3. Fire it up. `sudo docker-compose up -d`
