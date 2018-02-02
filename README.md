# demo

## migrations

TODO define ECS task
    alias dc=docker-compose
    dc up -d
    dc exec web ./manage.py migrate
    dc exec web ./manage.py createsuperuser
    open http://localhost:8080/

