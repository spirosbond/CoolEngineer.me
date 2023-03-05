.PHONY: *

#ex. make remote-init 
remote-init:
	scp -r * root@194.233.161.25:/root/islinked-me/

#ex. make deploy-prod f=./standalone/prod/islinked-me-0.2-emb.war
deploy-prod:
	echo "Deploying-prod $f..."
	-ssh root@194.233.161.25 'mv /root/islinked-me/standalone/prod/*.war /root/islinked-me/standalone/prod/archive/'
	scp $f root@194.233.161.25:/root/islinked-me/standalone/prod/
	ssh root@194.233.161.25 'cd /root/islinked-me/standalone/prod/ && make build f=$(notdir $f)'
# 	$(MAKE) restart-docker-compose

#ex. make deploy-dev f=./standalone/prod/islinked-me-0.2-emb.war
deploy-dev:
	echo "Deploying-dev $f..."
	-ssh root@194.233.161.25 'mv /root/islinked-me/standalone/dev/*.war /root/islinked-me/standalone/dev/archive/'
	scp $f root@194.233.161.25:/root/islinked-me/standalone/dev/
	ssh root@194.233.161.25 'cd /root/islinked-me/standalone/dev/ && make build f=$(notdir $f)'
# 	$(MAKE) restart-docker-compose

#ex. make deploy-dev-to-prod
deploy-dev-to-prod:
	-ssh root@194.233.161.25 'mv /root/islinked-me/standalone/prod/*.war /root/islinked-me/standalone/prod/archive/'
	ssh root@194.233.161.25 'cp /root/islinked-me/standalone/dev/*.war /root/islinked-me/standalone/prod/ && cd /root/islinked-me/standalone/prod/ && make build f=*.war'

#ex. make remote-build-prod
remote-build-prod:
	echo "Remote-building-prod..."
	scp ./standalone/prod/Dockerfile ./standalone/prod/Makefile ./standalone/prod/run-war.sh root@194.233.161.25:/root/islinked-me/standalone/prod/
	ssh root@194.233.161.25 'cd /root/islinked-me/standalone/prod/ && make build f=*.war'

#ex. make remote-build-dev
remote-build-dev:
	echo "Remote-building-dev..."
	scp ./standalone/dev/Dockerfile ./standalone/dev/Makefile ./standalone/dev/run-war.sh root@194.233.161.25:/root/islinked-me/standalone/dev/
	ssh root@194.233.161.25 'cd /root/islinked-me/standalone/dev/ && make build f=*.war'

#ex. make remote-build-nginx
remote-build-nginx:
	echo "Remote-building-nginx..."
	scp ./nginx/* root@194.233.161.25:/root/islinked-me/nginx/
	ssh root@194.233.161.25 'cd /root/islinked-me/nginx/ && make build'

#ex. make remote-build-docker-compose
remote-build-docker-compose:
	echo "Remote-building docker-compose..."
	scp ./docker-compose.yaml root@194.233.161.25:/root/islinked-me/
	ssh root@194.233.161.25 'cd /root/islinked-me/ && docker-compose up -d'

#ex. make remote-docker-prune
remote-docker-prune:
	echo "Remote docker-prune..."
	ssh root@194.233.161.25 'docker image prune -a'
	ssh root@194.233.161.25 'docker volume prune'
	ssh root@194.233.161.25 'docker network prune'

#ex. make remote-backup-prod p=/root/islinked-me/
remote-backup-prod-volume:
	echo "Remote Backup production volume at $p..."
	ssh root@194.233.161.25 'docker run --rm -v islinked-me_db-volume:/volume -v $p:/backup alpine tar -cjf /backup/islinked-me_db-volume.tar.bz2 -C /volume ./'
	scp root@194.233.161.25:/root/islinked-me/islinked-me_db-volume.tar.bz2 .

#ex. make remote-restore-volume-to-dev f=islinked-me_db-volume.tar.bz2 p=/root/islinked-me/
remote-restore-volume-to-dev:
	echo "Remote Restore volume $f located in $p to volume islinked-me_db-dev-volume..."
	ssh root@194.233.161.25 'docker run --rm -v islinked-me_db-dev-volume:/volume -v $p:/backup alpine sh -c "rm -rf /volume/* /volume/..?* /volume/.[!.]* ; tar -C /volume/ -xjf /backup/$f"'
	ssh root@194.233.161.25 'cd /root/islinked-me/ && docker-compose restart db-dev'

#ex. make remote-restore-volume-to-prod f=islinked-me_db-volume.tar.bz2 p=/root/islinked-me/
remote-restore-volume-to-prod:
	echo "Remote Restore volume $f located in $p to volume islinked-me_db-volume..."
	ssh root@194.233.161.25 'docker run --rm -v islinked-me_db-volume:/volume -v $p:/backup alpine sh -c "rm -rf /volume/* /volume/..?* /volume/.[!.]* ; tar -C /volume/ -xjf /backup/$f"'
	ssh root@194.233.161.25 'cd /root/islinked-me/ && docker-compose restart db'

#ex make remote-migrate-prod-volume-to-dev
remote-migrate-prod-volume-to-dev:
	echo "Remote Backup production volume at /root/islinked-me..."
	ssh root@194.233.161.25 'docker run --rm -v islinked-me_db-volume:/volume -v /root/islinked-me:/backup alpine tar -cjf /backup/islinked-me_db-volume.tar.bz2 -C /volume ./'
	echo "Remote Restore volume islinked-me_db-volume.tar.bz2 located in /root/islinked-me to volume islinked-me_db-dev-volume..."
	ssh root@194.233.161.25 'docker run --rm -v islinked-me_db-dev-volume:/volume -v /root/islinked-me:/backup alpine sh -c "rm -rf /volume/* /volume/..?* /volume/.[!.]* ; tar -C /volume/ -xjf /backup/islinked-me_db-volume.tar.bz2"'
	ssh root@194.233.161.25 'cd /root/islinked-me/ && docker-compose restart db-dev'

#ex. make remote-restart-docker
remote-restart-docker:
	echo "Restarting docker..."
	ssh root@194.233.161.25 'systemctl restart docker && cd /root/islinked-me/ && docker-compose up -d'

#ex. make remote-restart-docker-compose
remote-restart-docker-compose:
	echo "Restarting docker-compose..."
	ssh root@194.233.161.25 'cd /root/islinked-me/ && docker-compose up -d'

#ex. make remote-stop-docker-compose
remote-stop-docker-compose:
	echo "Stopping docker-compose..."
	ssh root@194.233.161.25 'cd /root/islinked-me/ && docker-compose down'

#Doesn't work with fish-shell
ssh-auth:
# 	for fish-shell
# 	eval (ssh-agent -c -t 300)
# 	for normal shell
	eval `ssh-agent -t 300`  
	exec ssh-add

#ex. make restore-volume-no-restart f=islinked-me_db-volume.tar.bz2 t=islinked-me_db-dev-volume p=/home/spirosbond/Projects-Docker/islinked-me/
restore-volume-no-restart:
	sudo docker run --rm -v $t:/volume -v $p:/backup alpine sh -c "rm -rf /volume/* /volume/..?* /volume/.[!.]* ; tar -C /volume/ -xjf /backup/$f"

#ex. make restore-volume-to-dev f=islinked-me_db-volume.tar.bz2 p=/home/spirosbond/Projects-Docker/islinked-me/
restore-volume-to-dev:
	sudo docker run --rm -v islinked-me_db-dev-volume:/volume -v $p:/backup alpine sh -c "rm -rf /volume/* /volume/..?* /volume/.[!.]* ; tar -C /volume/ -xjf /backup/$f"
	sudo docker-compose restart db-dev		