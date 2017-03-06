# Classic LAMP environment built on Docker-compose

Currently this project consists of:

- CentOS 6
- Apache 2.2
- MySQL 5.6
- PHP 5.6 ([Les RPM de Remi - Repository](http://rpms.famillecollet.com/))

# Install



#How to use

```bash
git clone -b suitecrm https://github.com/carlosqueiroz/docker-compose-lamp.git
cd docker-compose-lamp
docker-compose up -d
```

#Entering the container
```bash
docker-compose exec web bash
julia
exit
```

#Remove  all Conteiners and Images
```bash
docker rm --force $(docker ps -a -q)  
docker rmi --force $(docker images -q)
 ```

#Remove Conteiners in composer
'''
docker-compose rm
'''
