#######################################################################
#                    CREDENTIALS ARE FOR POC ONLY                     #
#######################################################################
include envfile
include envfile-local

root:
	sudo su root

common: root
	apt update
	apt install make
	apt install docker docker.io -y
	yes| apt install wget curl htop tmux vim ncdu ranger
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
#REF: https://stackoverflow.com/questions/49762840/unable-to-mount-efs-on-ec2-instance-connection-timed-out-error
#REF: https://www.youtube.com/watch?v=I9GO3mYeNAM
#STEPS: CREATE EFS > SELECT SAME REGION & ZONE! > SELECT SAME SEC-GROUP > ADD NFS TO SEC-GROUP > ATTACH THROUGH CLI
efs: root
	# PREPARE
	apt install nfs-common -y
	apt install python3-pip
	pip3 install botocore
	#REF: https://docs.aws.amazon.com/efs/latest/ug/installing-amazon-efs-utils.html#installing-other-distro
	apt install binutils -y
	git clone https://github.com/aws/efs-utils
	cd efs-utils
	./build-deb.sh
	yes| apt install ./build/amazon-efs-utils*deb
	# START TO MOUNT
	mkdir /myefs ||true
	echo 'fs-YOUR_EFS_ID.efs.us-east-1.amazonaws.com:/ /myefs efs defaults,_netdev 0 0' >> /etc/fstab
	mount -a
	# mount -t efs -o tls fs-YOUR_EFS_ID:/ /myefs
	mount |grep myefs
	df -h |grep myefs
	chmod go+rw /myefs
	mkdir -p /myefs/log
	mkdir -p /myefs/db
	mkdir -p /myefs/bin
	touch /myefs/README.txt
	wget http://speedtest-nyc1.digitalocean.com/100mb.test -O /myefs/100mb.test

#REF: https://hub.docker.com/_/postgres
pg: root
	yes| apt install pgcli
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
	yes| apt install redis-tools
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


minio: root
	mkdir -p /myefs/minio/bin/
	wget https://dl.min.io/server/minio/release/linux-amd64/minio -O /myefs/minio/bin/minio
	chmod +x /myefs/minio/bin/minio
	MINIO_ROOT_USER=admin MINIO_ROOT_PASSWORD=password /myefs/minio/bin/minio server /myefs/minio --console-address ":19001"
