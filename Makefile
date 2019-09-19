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
	 --env RUN_PARAM="-f -l 192.168.40.72 -s udp:192.168.40.72:12221 -A hq.wellcloud.cc -F -m 17912 -M 17951 -L 20000 -d ERR" \
	 --name rtpproxy  registry:5000/wecloud/rtpproxy:2.2.10
