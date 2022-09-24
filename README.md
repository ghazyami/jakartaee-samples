# Jakarta EE Sample

## Building & Testing

### Building

1. Maven wrapper is bundled

## Features

All features are pre-configured to run out of the box when running `Samples` using the described methods bellow

### Database

`Postgresql` is bundled as the main database for jwallet

### Security

`Keycloak` is pre-configured with a realm with default user with credentials `max/max`

## Running Samples

### 1. Docker compose

Requires

- `docker-compose`

Start / Stop

- start
  `./samples-cli.sh up`
- stop
  `./samples-cli.sh down`

Access service

- Database
  `localhost:5432`
- Keycloak
  `http://localhost:5050`
- Samples
  `http://localhost:8080/samples`
