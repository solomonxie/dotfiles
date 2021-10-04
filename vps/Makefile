root:
	sudo su root

common: root
	apt update
	apt install docker -y
	yes | apt install wget curl htop
	wget https://github.com/bcicen/ctop/releases/download/0.7.6/ctop-0.7.6-linux-amd64 -O /usr/local/bin/ctop
	chmod +x /usr/local/bin/ctop

bbr: root
	wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
	chmod +x tcp.sh
	./tcp.sh


shadowsocks: root
	wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
	chmod +x shadowsocks-all.sh
	./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

v2ray: root
	bash <(curl -s -L https://git.io/v2ray.sh)


#REF: https://docs.aws.amazon.com/efs/latest/ug/efs-mount-helper.html
#REF: https://docs.aws.amazon.com/zh_cn/efs/latest/ug/wt1-test.html
efs: root
	apt install nfs-common -y
	mkdir /myefs
	sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport THE_IP_OF_EFS:/ /myefs
	sudo chmod go+rw /myefs
	ls -lah /myefs
	touch /myefs/README.txt
	docker run --restart always \
		--name pg \
		-p 54320:5432 \
		-v /myefs/pg:/var/lib/postgresql/data \
		-e PGDATA=/var/lib/postgresql/data/pgdata \
		-e POSTGRES_USER=${PG_USER} \
		-e POSTGRES_PASSWORD=${PG_PWD} \
		-d postgres postgres -c log_statement=all
	docker run --restart always \
		--name rd \
		-p 63790:6379 \
		-v /myefs/redis:/data \
		-d redis:alpine \
		redis-server --appendonly yes
	docker run --restart always \
		--name mongo \
		-p 18081:27017 \
		-e MONGO_INITDB_ROOT_USERNAME=${MONGO_USER} \
		-e MONGO_INITDB_ROOT_PASSWORD=${MONGO_PWD} \
		-v /myefs/mongo:/data/db \
		-d mongo
