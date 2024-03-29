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
