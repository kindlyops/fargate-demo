# demo

## migrations

TODO define ECS task

    alias dc=docker-compose 
    dc up -d 
    dc exec web ./manage.py migrate 
    dc exec web ./manage.py createsuperuser 
    open http://localhost:8080/

## debugging

    dc exec web ./manage.py
    [1]: from django.contrib.auth.models import User
    [2]: user = User.objects.get(username='appuser')
    [3]: User.objects.count()

## publish

docker build -t kindlyops/fargate-demo . docker push kindlyops/fargate-demo
