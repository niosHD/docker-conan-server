# docker-conan-server

Docker image definition for a [Conan.io](https://conan.io) server

## Running the server

First create the server container
```bash
$ mkdir conan_server
$ docker run \
    -p 9300:9300 \
    -v `pwd`/conan_server:/var/lib/conan/.conan_server \
    --name conan-server \
    nioshd/conan-server:latest
```

The configure the server by editing the `.conan_server/server.conf`
file. The `host_name` and `public_port` parameters are of particular
importance and must match the name of the docker host and the public
port exposed for the container. For more information of the server.conf, see
http://conanio.readthedocs.io/en/latest/server.html#server-configuration.

## Example docker-compose.yml file

```
version: '2'
services:
  conan:
    image: nioshd/conan-server:latest
    container_name: conan-server
    volumes:
      - ./conan_server:/var/lib/conan/.conan_server
    ports:
      - 9300:9300
    restart: always
```
