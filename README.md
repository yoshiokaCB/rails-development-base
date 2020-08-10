# Rails Development Base


## Description

Build Rails + MySQL development environment using Docker Compose

## Usage

```
$ git clone https://github.com/yoshiokaCB/rails-development-base.git ./[app-name]
$ cd [app-name]
$ docker-compose build
$ docker-compose run --rm app rails new . --force -d mysql

# use react
$ docker-compose run --rm app rails new . --webpack=react --force -d mysql
```

## Example

### Set Config

```
$ vi config/database.yml
```

```
default: &default
  adapter: postgresql
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: <%= ENV["DATABASE_HOST"] %>
  database: <%= ENV["DATABASE_NAME"] %>
  username: <%= ENV['DATABASE_USER'] %>
  password: <%= ENV['DATABASE_PASSWORD'] %>
  port: <%= ENV['DATABASE_PORT'] %>
  encoding: <%= ENV['DATABASE_ENCODING'] %>

development:
  <<: *default

test:
  <<: *default
  database: <%= ENV["DATABASE_NAME"] %>_test

production:
  <<: *default

```

```
$ docker-compose run --rm app rails g scaffold tasks name:string description:text
$ docker-compose run --rm app rails db:create
$ docker-compose run --rm app rails db:migrate
```



### Start app

```
$ docker-compose run --rm --service-ports app
```
