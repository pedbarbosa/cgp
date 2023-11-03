# cgp

## CollectD Graph Panel (CGP) on a Docker container

This repository contains a Dockerfile to build a Docker image with CollectD Graph Panel running on Apache and PHP.

The Docker image is available in [Docker Hub](https://hub.docker.com/r/pedbarbosa/cgp/).

### Docker compose usage example

```
services:
  cgp:
    image: pedbarbosa/cgp
    container_name: cgp
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /var/lib/collectd/rrd:/var/lib/collectd/rrd:ro
    ports:
      - 80:80
    healthcheck:
      test: "curl -ILXGET http://localhost"
    restart: always
```
