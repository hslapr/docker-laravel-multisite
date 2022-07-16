sed -i "s/1000:1000/$(id -u):$(id -g)/" docker-compose.yml
sed -i "s/-g 1000 user/-g $(id -g) $(id -gn)/g" php/Dockerfile
sed -i "s/useradd user -u 1000 -g 1000/useradd $(id -un) -u $(id -u) -g $(id -g)/" php/Dockerfile
docker-compose build
