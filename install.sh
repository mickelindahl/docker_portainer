export $(cat .env | xargs)

cp sample.docker-compose.yml docker-compose.yml
sed -i "s#{virtual-host}#$VIRTUAL_HOST#g" docker-compose.yml

cp sample.domain.com $VIRTUAL_HOST
mv $VIRTUAL_HOST $PATH_NGINX/conf/vhost.d/$VIRTUAL_HOST


docker-compose stop
docker-compose rm -f
docker-compose up -d

