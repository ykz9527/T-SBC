run:
	docker run -d --net host \
        --env RUN_PARAM="-F -m 250 -M 8" \
        -v /root/sbc:/usr/local/etc/opensips \
	-v /var/log:/var/log \
	--name opensips registry:5000/wecloud/opensips:2.4.6.build.37

restart:
	docker rm -f opensips 
	make run
	make logf

logs:
	docker logs opensips 

logf:
	docker logs -f opensips

run-rtp:
	docker run -d --net host  \
	 --env RUN_PARAM="-f -l 0.0.0.0  -s udp:192.168.40.72:12221 -A 101.229.81.32 -F -m 18000 -M 18019 -L 20000 -d DBUG" \
	 --name rtpproxy  registry:5000/wecloud/rtpproxy:2.2.7
restart-rtp:
	docker rm -f rtpproxy
	make run-rtp
