#######################################################################
#                    CREDENTIALS ARE FOR POC ONLY                     #
#######################################################################

root:
	sudo su root

common: root
	apt update
	apt install docker -y
	yes| apt install wget curl htop tmux vim ncdu
	wget https://github.com/bcicen/ctop/releases/download/0.7.6/ctop-0.7.6-linux-amd64 -O /usr/local/bin/ctop
	chmod +x /usr/local/bin/ctop
	yes| apt install python3 python3-pip
	yes| pip3 install sqlite-web

bbr: root
	wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
	chmod +x tcp.sh
	./tcp.sh


shadowsocks: root
	wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
	chmod +x shadowsocks-all.sh
	./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

#REF: https://233v2.com/post/1/
v2ray: root
	bash <(curl -s -L https://git.io/v2ray.sh)


#REF: https://docs.aws.amazon.com/efs/latest/ug/efs-mount-helper.html
#REF: https://docs.aws.amazon.com/zh_cn/efs/latest/ug/wt1-test.html
efs: root
	apt install nfs-common -y
	mkdir /myefs
	mkdir /myefs/log
	sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport YOUR_IP_OF_EFS:/ /YOUR_PATH_TO_LOCAL
	sudo chmod go+rw /myefs
	ls -lah /myefs
	touch /myefs/README.txt

#REF: https://hub.docker.com/_/postgres
pg: root
	apt install pgcli
	docker run --restart always \
		--name pg \
		-p 54320:5432 \
		-v /myefs/pg:/var/lib/postgresql/data \
		-e PGDATA=/var/lib/postgresql/data/pgdata \
		-e POSTGRES_USER=sol \
		-e POSTGRES_PASSWORD=123123 \
		-d postgres postgres -c log_statement=all

#REF: https://hub.docker.com/_/redis
redis: root
	apt install redis-tools
	docker run --restart always \
		--name rd \
		-p 63790:6379 \
		-v /myefs/redis:/data \
		-d redis:alpine \
		redis-server --appendonly yes

#REF: https://hub.docker.com/_/mongo
mongo: root
	docker run --restart always \
		--name mongo \
		-p 18081:27017 \
		-e MONGO_INITDB_ROOT_USERNAME=sol \
		-e MONGO_INITDB_ROOT_PASSWORD=123123 \
		-v /myefs/mongo:/data/db \
		-d mongo

#REF: https://hub.docker.com/_/mysql
mysql: root
	mkdir /myefs/mysql
	docker run --restart always \
		--name mysql \
		-p 23306:3306 \
		-v /myefs/mysql:/var/lib/mysql \
		-e MYSQL_ROOT_PASSWORD=abc123 \
		-e MYSQL_DATABASE=demo \
		-e MYSQL_USER=sol \
		-e MYSQL_PASSWORD=123123 \
		mysql -h 0.0.0.0

sqlite: root
	yes| apt install sqlite sqlite3
	#REF: https://github.com/coleifer/sqlite-web
	sqlite_web --host 0.0.0.0 --port 61591 /myefs/sqlite/mysqlite.db > /myefs/log/sqlite.log 2>&1 &


nginx: root
	mkdir -p /myefs/log/nginx
	mkdir -p /myefs/fileshare
	mkdir -p /myefs/sqlite
	mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf_bak_`date +%F`
	cp ./efs_nginx.conf /etc/nginx/nginx.conf
	service nginx start ||true
	service nginx restart
	service nginx status
