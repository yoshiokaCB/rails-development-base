# Rails Development Base


## Description

Build Rails + Postgresql development environment using Docker Compose

## Usage

```
$ git clone https://github.com/yoshiokaCB/rails-development-base.git ./[app-name]
$ cd [app-name]
$ docker-compose build
$ docker-compose run web rails new . --force -d postgresql
```

## etc

```
$ docker-compose run web rails g scaffold tasks name:string description:text
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate

# start app
$ docker-compose run --rm --service-ports web
```
