SERVER_NAME         = $(subst _,.,$(subst -,.,$(notdir $(CURDIR))))
MYSQL_ROOT_PASSWORD = ${SERVER_NAME}
MYSQL_DATABASE      = ${SERVER_NAME}
MYSQL_USER          = ${SERVER_NAME}
MYSQL_PASSWORD      = ${SERVER_NAME}
text = /home/usr/
test:
	@echo ${SERVER_NAME}
	@echo ${MYSQL_USER}
	@echo ${MYSQL_PASSWORD}
	@echo ${MYSQL_DATABASE}
	@echo ${MYSQL_ROOT_PASSWORD}



install: 
	export SERVER_NAME=$(SERVER_NAME)
	chmod +x .docker/install.sh
	.docker/install.sh

remove: 
	export SERVER_NAME=$(SERVER_NAME)
	docker-compose down --rmi all
	sudo sh -c "sed -i -e 's/127.0.0.1   $(SERVER_NAME)//g' /etc/hosts"
